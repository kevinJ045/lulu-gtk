
local {
  @default_to("")
  #uri,
  @default_to(nil)
  #label
} ->
  @GtkWidgetNative('gtk_link_button_new')
  @GtkWidgetWithOptions({
    uri = 1,
    visited = -1
  }, 'gtk_link_button', "GtkLinkButton*")
  LinkButton:GtkWidget
do
end

return LinkButton
