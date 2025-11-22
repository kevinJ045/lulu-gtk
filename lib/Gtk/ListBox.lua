
local {} ->
  @GtkWidgetNative('gtk_list_box_new')
  @GtkWidgetWithOptions({
    selection_mode = -1,
    show_separators = -1
  }, 'gtk_list_box', "GtkListBox*")
  @GtkWidgetHandleChildren('append')
  ListBox:GtkWidget
do

  @GtkWidgetOperation({
    operation = 'gtk_list_box_append',
    cast = 'GtkListBox*',
    arguments = {true},
  })
  @GtkWidgetChildrenHandler(1)
  @GtkWidgetReturnSelf()
  function ListBox:append(child) end

end

return ListBox
