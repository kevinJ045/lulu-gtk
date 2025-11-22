
local {} ->
  @GtkWidgetNative('gtk_stack_new')
  @GtkWidgetWithOptions({
    transition_type = -1,
    transition_duration = -1
  }, 'gtk_stack', "GtkStack*")
  Stack:GtkWidget
do

  function Stack:init(o)
    if type(o) == "table" and o.children then
      for _, child in ipairs(o.children) do
        self:add_titled(child.widget, child.name, child.title)
      end
    end
  end

  @GtkWidgetOperation({
    operation = 'gtk_stack_add_titled',
    cast = 'GtkStack*',
    arguments = {true, true, true},
  })
  @GtkWidgetReturnSelf()
  function Stack:add_titled(widget, name, title)
    table.insert(self.children, {
      widget = widget,
      name = name,
      title = title
    })
  end

end

return Stack
