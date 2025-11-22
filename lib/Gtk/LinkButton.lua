
local {
  @default_to("")
  #uri,
  @default_to(nil)
  #label
} ->
  @GtkWidgetNative('gtk_link_button_new')
  @GtkWidgetWithOptions({
    uri = -1,
    visited = -1
  }, 'gtk_link_button', "GtkLinkButton*")
  LinkButton:GtkWidget
do
  @GtkWidgetOperation({
    operation = 'gtk_link_button_get_uri',
    cast = 'GtkLinkButton*',
    arguments = {},
  })
  function LinkButton:get_uri()
  end

  @GtkWidgetOperation({
    operation = 'gtk_link_button_set_uri',
    cast = 'GtkLinkButton*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function LinkButton:set_uri(uri)
  end
end

return LinkButton
