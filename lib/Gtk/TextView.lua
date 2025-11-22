
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
  function TextView:init(o)
    if type(o) == "table" and o.buffer then
      self:set_buffer(o.buffer)
    end
  end

  @GtkWidgetOperation({
    operation = 'gtk_text_view_get_buffer',
    cast = 'GtkTextView*',
    arguments = {},
  })
  function TextView:get_buffer()
  end

  @GtkWidgetOperation({
    operation = 'gtk_text_view_set_buffer',
    cast = 'GtkTextView*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function TextView:set_buffer(buffer)
    self.buffer = buffer
  end
end

return TextView
