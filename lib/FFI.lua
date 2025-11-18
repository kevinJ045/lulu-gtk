local Gtk = {}

using {
  dylib"@gtk-4""gtk"(
    include_string! "../include/gtk4.h";
  )
}


Gtk.ffi = gtk

local function globalize(fn, name)
  into_global(name, fn)
end

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

return into_global('Gtk', Gtk)