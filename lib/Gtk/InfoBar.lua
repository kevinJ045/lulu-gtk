
local {} ->
  @GtkWidgetNative('gtk_info_bar_new')
  @GtkWidgetWithOptions({
    message_type = gtk_option_mapper {
      mapper = GtkMessageType::index,
      at = -1
    },
    show_close_button = -1
  }, 'gtk_info_bar', "GtkInfoBar*")
  InfoBar:GtkWidget
do

  function InfoBar:init(o)
    if type(o) == "table" then
      if o.child then
        self:add_child(o.child)
      end
      if o.buttons then
        for _, button in ipairs(o.buttons) do
          self:add_button(button.text, button.response_id)
        end
      end
    end
  end

  @GtkWidgetOperation({
    operation = 'gtk_info_bar_add_child',
    cast = 'GtkInfoBar*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function InfoBar:add_child(child)
    table.insert(self.children, child)
  end

  @GtkWidgetOperation({
    operation = 'gtk_info_bar_add_button',
    cast = 'GtkInfoBar*',
    arguments = {true, true},
  })
  function InfoBar:add_button(text, response_id)
  end

end

return InfoBar
