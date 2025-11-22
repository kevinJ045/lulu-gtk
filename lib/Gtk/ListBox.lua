
local {} ->
  @GtkWidgetNative('gtk_list_box_new')
  @GtkWidgetWithOptions({
    selection_mode = -1,
    show_separators = -1
  }, 'gtk_list_box', "GtkListBox*")
  ListBox:GtkWidget
do

  function ListBox:init(o)
    if type(o) == "table" and o.children then
      for _, child in ipairs(o.children) do
        self:append(child)
      end
    end
  end

  @GtkWidgetOperation({
    operation = 'gtk_list_box_append',
    cast = 'GtkListBox*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function ListBox:append(child)
    table.insert(self.children, child)
  end

end

return ListBox
