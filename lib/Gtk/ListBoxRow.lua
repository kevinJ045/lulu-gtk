
local {} ->
  @GtkWidgetNative('gtk_list_box_row_new')
  @GtkWidgetWithOptions({
    activatable = -1,
    selectable = -1
  }, 'gtk_list_box_row', "GtkListBoxRow*")
  ListBoxRow:GtkWidget
do

  function ListBoxRow:init(o)
    if type(o) == "table" and o.child then
      self:set_child(o.child)
    end
  end

  @GtkWidgetOperation({
    operation = 'gtk_list_box_row_set_child',
    cast = 'GtkListBoxRow*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function ListBoxRow:set_child(child)
    self.child = child
  end

end

return ListBoxRow
