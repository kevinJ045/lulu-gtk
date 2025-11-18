
local {} ->
  @GtkWidgetNative('gtk_application_window_new')
  Window
do

  function Window:set_title(title)
    Gtk.ffi.gtk_window_set_title(ffi.cast("GtkWindow*", self.ptr), title)
    return self
  end

  function Window:set_default_size(width, height)
    Gtk.ffi.gtk_window_set_default_size(ffi.cast("GtkWindow*", self.ptr), width, height)
    return self
  end

  function Window:set_child(child)
    Gtk.ffi.gtk_window_set_child(ffi.cast("GtkWindow*", self.ptr), child.ptr)
    return self
  end

  function Window:show()
    Gtk.ffi.gtk_widget_show(self.ptr)
    return self
  end

end

return Window


