
local {} ->
  @GtkWidgetNative('gtk_text_view_new')
  @GtkWidgetWithOptions({
    editable = -1,
    cursor_visible = -1,
    monospace = -1,
    wrap_mode = -1,
    buffer = -1
  }, 'gtk_text_view', "GtkTextView*")
  TextView:GtkWidget
do

end

return TextView
