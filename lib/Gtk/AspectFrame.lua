
local {} ->
  @GtkWidgetNative('gtk_aspect_frame_new')
  @GtkWidgetWithOptions({
    xalign = -1,
    yalign = -1,
    ratio = -1,
    obey_child = -1
  }, 'gtk_aspect_frame', "GtkAspectFrame*")
  AspectFrame:GtkWidget
do

  function AspectFrame:init(o)
    if type(o) == "table" and o.child then
      self:set_child(o.child)
    end
  end

  @GtkWidgetOperation({
    operation = 'gtk_aspect_frame_set_child',
    cast = 'GtkAspectFrame*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function AspectFrame:set_child(child)
    self.child = child
  end

end

return AspectFrame
