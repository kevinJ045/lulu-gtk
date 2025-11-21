
local {
  @default_to("")
  text
} ->
  @GtkWidgetNative('gtk_label_new')
  @GtkWidgetWithOptions({
    text = 1
  }, 'gtk_label', "GtkLabel*")
  Label
do
  
end

return Label
