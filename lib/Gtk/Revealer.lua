
local {} ->
  @GtkWidgetNative('gtk_revealer_new')
  @GtkWidgetWithOptions({
    reveal_child = -1,
    transition_type = -1,
    transition_duration = -1
  }, 'gtk_revealer', "GtkRevealer*")
  Revealer:GtkWidget
do

  function Revealer:init(o)
    if type(o) == "table" and o.child then
      self:set_child(o.child)
    end
  end

  @GtkWidgetOperation({
    operation = 'gtk_revealer_set_child',
    cast = 'GtkRevealer*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function Revealer:set_child(child)
    self.child = child
  end

  @GtkWidgetOperation({
    operation = 'gtk_revealer_get_reveal_child',
    cast = 'GtkRevealer*',
    arguments = {},
  })
  function Revealer:get_reveal_child()
  end

  @GtkWidgetOperation({
    operation = 'gtk_revealer_set_reveal_child',
    cast = 'GtkRevealer*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function Revealer:set_reveal_child(b)
  end
end

return Revealer
