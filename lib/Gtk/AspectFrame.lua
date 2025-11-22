
local {
  @default_to(1.0)
  xalign,
  @default_to(1.0)
  yalign,
  @default_to(0.0)
  ratio,
  @map_into(function(e) return e or false end)
  obey_child

} ->
  @GtkWidgetNative('gtk_aspect_frame_new')
  @GtkWidgetWithOptions({
    xalign = 1,
    yalign = 2,
    ratio = 3,
    obey_child = 4
  }, 'gtk_aspect_frame', "GtkAspectFrame*")
  @GtkWidgetHandleChild('set_child')
  AspectFrame:GtkWidget
do

  @GtkWidgetOperation({
    operation = 'gtk_aspect_frame_set_child',
    cast = 'GtkAspectFrame*',
    arguments = {true},
  })
  @GtkWidgetChildHandler(1)
  @GtkWidgetReturnSelf()
  function AspectFrame:set_child(child) end

end

return AspectFrame
