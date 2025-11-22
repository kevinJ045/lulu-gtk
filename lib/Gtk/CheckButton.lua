
local {
  @default_to("")
  #label,
} ->
  @GtkWidgetNative('gtk_check_button_new_with_label')
  @GtkWidgetWithOptions({
    label = 1,
    active = -1
  }, 'gtk_check_button', "GtkCheckButton*")
  CheckButton:GtkWidget
do

end

return CheckButton
