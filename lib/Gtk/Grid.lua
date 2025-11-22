
local {} ->
  @GtkWidgetNative('gtk_grid_new')
  @GtkWidgetWithOptions({
    row_spacing = -1,
    column_spacing = -1,
    row_homogeneous = -1,
    column_homogeneous = -1
  }, 'gtk_grid', "GtkGrid*")
  @GtkWidgetHandleChildren('attach')
  Grid:GtkWidget
do

  @GtkWidgetOperation({
    operation = 'gtk_grid_attach',
    cast = 'GtkGrid*',
    arguments = {true, false, false, false, false},
  })
  @GtkWidgetChildrenHandler(1)
  @GtkWidgetReturnSelf()
  function Grid:attach(child, column, row, width, height) end

end

return Grid
