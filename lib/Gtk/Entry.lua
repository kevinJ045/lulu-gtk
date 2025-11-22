
local {} ->
  @GtkWidgetNative('gtk_entry_new')
  @GtkWidgetWithOptions({
    text = -1,
    placeholder_text = -1,
    visibility = -1,
    invisible_char = -1
  }, 'gtk_entry', "GtkEntry*")
  Entry:GtkWidget
do
  @GtkWidgetOperation({
    operation = 'gtk_entry_get_text',
    cast = 'GtkEntry*',
    arguments = {},
  })
  function Entry:get_text()
  end

  @GtkWidgetOperation({
    operation = 'gtk_entry_set_text',
    cast = 'GtkEntry*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function Entry:set_text(text)
  end
end

return Entry
