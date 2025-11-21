---< Gtk >---
-- A global variable that will
-- hold all the gtk components
local Gtk = {}

---< Gtk4.so/dll >---
---< the dylib
-- We `use` @gtk-4, this will look for 
-- `libgtk-4.so` or `gtk-4.dll` in all
-- relevant paths.
---< the gtk4.h
-- We include it as a string and pass it
-- to the dylib to use register to ffi.cdef.
-- This way, we can handle everything in one
-- operation.
---< the gtk namespace
-- This operation will register a new namespace
-- called "gtk". It's the ffi entry where all
-- the C symbols are stored.
using {
  dylib"@gtk-4""gtk"(
    include_string! "../include/gtk4.h";
  ),
  lulib { state, "./State.lua" }
}

--- The interlop
-- We pass the gtk namespace as `Gtk.ffi` for
-- direct ffi access from `Gtk` namespace. 
Gtk.ffi = gtk

local function emmasivate_options(self, option_map, options, each, onlyif)
  local o = options or {}
  for _, name in pairs(option_map) do

    local continue = true

    if onlyif then
      if o[name] == nil then
        continue = false
      end
    end

    if continue then
      local omap = in if self.__options_map then
        return self.__options_map[name]
      end
      
      if o[name] != nil then
        self[name] = o[name]
      end

      local v = in if omap then
        return omap(state.get_state_value(self, name, self[name]))
      else
        return state.get_state_value(self, name, self[name])
      end

      each(name, v, self[name])
    end
  end
end

----<| Decorators |>----
---< Explanation:
-- Decorators in lulu are functions that
-- change the behavior of entities such as
-- functions/classes/enums/enum variants/parameters.
---< Purpose:
-- They simplify operations by breaking them down
-- into simpler applicable "traits".
----<| ... |>----

---< GtkWidgetNative: Main Class Decorator >---
-- Once applied, it helps a class be a complete
-- GtkWidget by handling the C function that
-- is responsible for creating the widget.
---< Usage:
-- ```lua
-- local {...} -> @GtkWidgetNative('gtk_widget_new') MyWidget
-- ```
into_global('GtkWidgetNative', function(name)
  return function(_class)
    function _class:init(...)
      local args = {...}
      local f = Gtk.ffi[name]
      if _class.__options then
        local arg = {}
        emmasivate_options(self, _class.__options, args[1], function(_, val)
          table.insert(arg, val)
        end)
        self.ptr = f(unpack(arg))
      else
        self.ptr = f(...)
      end

      self.options = args[1]
      self.id = uuid.v4()

      if _class.__options_provided then
        emmasivate_options(self, _class.__options_provided, args[1], function(name, _, oval)
          if oval then
            self[f"set_{name}"](self, oval)
          end
        end, false)
      end
    end
    return _class
  end
end)

local function do_gtk_operations(self, args, options)
  local item = in if options.cast then
    return ffi.cast(options.cast, self.ptr)
  else
    return self.ptr
  end

  local arguments = in for i, v in pairs(options.arguments or {}) do
    if v == true then
      collect(args[i].ptr)
    elseif type(v) == "function" then
      collect(v(args[i]))
    else
      collect(args[i])
    end
  end

  try_catch! {
    Gtk.ffi[options.operation](item, unpack(arguments))
  }, {
    error(f"Error on gtk operation: {options.operation}: {err}")
  }
end

into_global('GtkWidgetWithOptions', function(...)
  local opts = {...}
  return function(_class)
    if type(opts[1]) == "string" then
      _class.__options = opts
    elseif type(opts[1]) == "table" then
      _class.__option_setter_index = opts[2]
      _class.__options = {}
      _class.__options_provided = {}
      local idx = 0
      local default_cast = opts[3]

      for name, mapper in pairs(opts[1]) do
        if not _class.__options_map then
          _class.__options_map = {}
        end

        if mapper == -1 then
          table.insert(_class.__options_provided, name)
        elseif type(mapper) == "function" or type(mapper) == "table" then
          _class.__options_map[name] = mapper

          if type(mapper) == "table" and mapper.at == -1 then
            table.insert(_class.__options_provided, name)
          else
            _class.__options[
              type(mapper) == "table" and mapper.at or idx
            ] = name
          end
        else
          _class.__options[mapper or idx] = name
        end

        idx = #_class.__options

        _class[f"set_{name}"] = function(self, v)
          local val = state.get_state_value(self, name, in if _class.__options_map and _class.__options_map[name] then
            return _class.__options_map[name](v)
          else
            return v
          end)

          local options = in if type(mapper) == "table" then
            if not mapper.operation then
              mapper.operation = f"{_class.__option_setter_index}_set_{name}"
            end

            if not mapper.arguments then
              mapper.arguments = {false}
            end
            
            return mapper
          else
            return {
              operation = f"{_class.__option_setter_index}_set_{name}",
              arguments = {false}
            }
          end

          if default_cast and not options.cast then
            options.cast = default_cast
          end

          self[name] = v

          do_gtk_operations(self, {val}, options)
          return self
        end
        
      end
    end
    return _class
  end
end)

into_global('GtkWidgetHandleChildren', function(name)
  return function(_class)
    function _class:init()
      if self.child then
        self.children = { self.child }
        self.child = nil
      end
      if self.children then
        local children = self.children
        if not instanceof(self.children, Vec) then
          children = Vec(self.children)
        end
        foreach(children.items)(function(child)
          self[name](self, child)
        end)
        self.children = children
      end
    end
    return _class
  end
end)


into_global('GtkWidgetReturnSelf', function()
  return function(_class, func)
    return function(self, ...)
      func(self, ...)
      return self
    end
  end
end)

into_global('GtkWidgetChildrenHandler', function(idx, shift)
  return function(_class, func)
    return function(self, ...)
      local child = ({...})[idx]
      if not self.children then
        self.children = Vec()
      end
      if not instanceof(self.children, Vec) then
        self.children = Vec(self.children)
      end
      local found = self.children:find((e) => return e.id == child.id end)
      if not found then
        if shift then
          self.children:insert(1, child)
        else
          self.children:push(child)
        end
      end
      return func(self, ...)
    end
  end
end)

into_global('GtkWidgetChildrenRemover', function(idx)
  return function(_class, func)
    return function(self, ...)
      local child = ({...})[idx]
      if not self.children then
        self.children = Vec()
      end
      if not instanceof(self.children, Vec) then
        self.children = Vec(self.children)
      end
      self.children:remove((e) => return e.id == child.id end)
      return func(self, ...)
    end
  end
end)

into_global('GtkWidgetOperation', function(options)
  return function(_class, func)
    return function(self, ...)
      local args = {...}
      local result = do_gtk_operations(self, args, options)

      local returns = nil
      if options.collect then
        returns = func(self, result, ...)
      else
        returns = func(self, ...)
      end

      if options.returns then
        return result
      end
      
      return returns
    end
  end
end)

into_global('gtk_option_mapper', function(option, mapper)

  if type(mapper) == "number" then
    mapper = {
      at = mapper
    }
  end

  if type(option) == "function" and not mapper then
    mapper = {
      at = -1
    }
  end

  if mapper then
    mapper.mapper = option
    option = mapper
  end

  return setmetatable(option, {
    __call = function(t, v)
      if option.mapper then
        return option.mapper(v)
      else
        return v
      end
    end
  })
end)

Gtk.State = state.State

class! Gtk.Widget, {
  init(options){
    local options = options or {}
    self.__event_handlers = Vec()
    if type(options) == "table" then
      for k, v in pairs(options) do
        if k:sub(1, 3) == "on_" then
          local event = k:sub(4, #k)
          self:connect(event, v)
          options[k] = nil
        end
      end
    end
  }

  connect(signal_name, lua_fn){

    self._ffi_callbacks = self._ffi_callbacks or {}
    local ffi_cb = ffi.cast("GCallback", function(widget_ptr)
      lua_fn(widget_ptr)
    end)
    table.insert(self._ffi_callbacks, ffi_cb)

    Gtk.ffi.g_signal_connect_data(
      self._ptr,
      signal_name,
      ffi_cb,
      nil,
      nil,
      0
    )
    return self
  }

}

into_global('GtkWidget', Gtk.Widget)

return into_global('Gtk', Gtk)