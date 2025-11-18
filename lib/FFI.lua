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
  )
}

--- The interlop
-- We pass the gtk namespace as `Gtk.ffi` for
-- direct ffi access from `Gtk` namespace. 
Gtk.ffi = gtk

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
        local o = args[1] or {}
        for _, v in pairs(_class.__options) do
          local omap = in if _class.__options_map then
            return _class.__options_map[v]
          end
          if o[v] then
            self[v] = o[v]
          end
          table.insert(arg, in if omap then
            return omap(self[v])
          else return self[v] end)
        end
        self.ptr = f(unpack(arg))
      else
        self.ptr = f(...)
      end

      self.id = uuid.v4()
    end
    return _class
  end
end)

into_global('GtkWidgetWithOptions', function(...)
  local opts = {...}
  return function(_class)
    _class.__options = opts
    return _class
  end
end)

into_global('GtkWidgetOptionOverride', function(name, mapper)
  return function(_class)
    if not _class.__options_map then
      _class.__options_map = {}
    end
    _class.__options_map[name] = mapper
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

into_global('GtkWidgetOperation', function(options)
  return function(_class, func)
    return function(self, ...)
      local args = {...}
      if options.operation then
        local item = in if options.cast then
          return ffi.cast(options.cast, self.ptr)
        else
          return self.ptr
        end

        local arguments = in for i, v in pairs(options.arguments or {}) do
          if v == true then
            collect(args[1].ptr)
          else
            collect(args[1])
          end
        end

        Gtk.ffi[options.operation](item, unpack(arguments))
      end
      return func(self, ...)
    end
  end
end)

return into_global('Gtk', Gtk)