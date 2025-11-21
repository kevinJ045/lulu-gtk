
local {
  @default_to("")
  #label,
  
} ->
  @GtkWidgetNative('new')
  @GtkWidgetWithOptions({
    label = -1,
    icon_name = -1,
  }, 'gtk_button', "GtkButton*")
  Button:GtkWidget
do
  
end

return Button
