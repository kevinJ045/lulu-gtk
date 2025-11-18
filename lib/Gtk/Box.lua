
local {
  @default_to('vertical')
  #orientation,
  @default_to(5)
  #spacing
  @default_to(Vec())
  #children
} ->
  @GtkWidgetNative('gtk_box_new')
  @GtkWidgetWithOptions('orientation', 'spacing')
  @GtkWidgetOptionOverride(
    'orientation',
    function(o)
      return in if o == "horizontal" then return 0 else return 1 end
    end
  )
  @GtkWidgetHandleChildren('append')
  Box
do

  function Box:append(child)
    Gtk.ffi.gtk_box_append(ffi.cast("GtkBox*", self.ptr), child.ptr)
    if not self.children then
      self.children = Vec()
    end
    if not instanceof(self.children, Vec) then
      self.children = Vec(self.children)
    end
    local found = self.children:find((e) => return e.id == child.id end)
    if not found then
      self.children:push(child)
    end
    return self
  end

end

return Box


