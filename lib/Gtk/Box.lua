
local {
  @default_to('vertical')
  #orientation,
  @default_to(5)
  #spacing
} ->
  @GtkWidgetNative('gtk_box_new')
  @GtkWidgetWithOptions('orientation', 'spacing')
  @GtkWidgetOptionOverride(
    'orientation',
    function(o)
      return in if o == "horizontal" then return 0 else return 1 end
    end
  )
  Box
do

  function Box:append(child)
    Gtk.ffi.gtk_box_append(ffi.cast("GtkBox*", self.ptr), child.ptr)
    return self
  end

end

return Box


