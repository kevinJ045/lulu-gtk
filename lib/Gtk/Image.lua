
local {
  @default_to(nil)
  #file,
  @default_to(nil)
  #icon_name,
  @default_to(nil)
  #gicon
} ->
  @GtkWidgetNative('gtk_image_new')
  @GtkWidgetWithOptions({
    file = -1,
    icon_name = -1,
    gicon = -1,
    pixel_size = -1
  }, 'gtk_image', "GtkImage*")
  Image:GtkWidget
do
end

return Image
