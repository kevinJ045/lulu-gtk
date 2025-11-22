
local {} ->
  @GtkWidgetNative('gtk_scrolled_window_new')
  @GtkWidgetWithOptions({
    hscrollbar_policy = -1,
    vscrollbar_policy = -1,
    min_content_width = -1,
    min_content_height = -1,
    max_content_width = -1,
    max_content_height = -1,
    propagate_natural_width = -1,
    propagate_natural_height = -1
  }, 'gtk_scrolled_window', "GtkScrolledWindow*")
  ScrolledWindow:GtkWidget
do

  function ScrolledWindow:init(o)
    if type(o) == "table" and o.child then
      self:set_child(o.child)
    end
  end

  @GtkWidgetOperation({
    operation = 'gtk_scrolled_window_set_child',
    cast = 'GtkScrolledWindow*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function ScrolledWindow:set_child(child)
    self.child = child
  end

end

return ScrolledWindow
