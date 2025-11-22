
local {} ->
  @GtkWidgetNative('gtk_revealer_new')
  @GtkWidgetWithOptions({
    reveal_child = -1,
    transition_type = gtk_option_mapper {
      mapper = GtkRevealerTransition::index,
      at = -1,
    },
    transition_duration = -1
  }, 'gtk_revealer', "GtkRevealer*")
  Revealer:GtkWidget
do

  @GtkWidgetOperation({
    operation = 'gtk_revealer_set_child',
    cast = 'GtkRevealer*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function Revealer:set_child(child) end

end

return Revealer
