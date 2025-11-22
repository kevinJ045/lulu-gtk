
local {
  @default_to('horizontal')
  #orientation
} ->
  @GtkWidgetNative('gtk_separator_new')
  @GtkWidgetWithOptions({
    orientation = gtk_option_mapper {
      cast = "GtkOrientable*",
      mapper = GtkOrientation::index,
      at = 1,
      operation = "gtk_orientable_set_orientation"
    }
  }, 'gtk_separator', "GtkSeparator*")
  Separator:GtkWidget
do
end

return Separator
