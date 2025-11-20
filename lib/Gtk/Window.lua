

--- Window Class ---
local {} ->
  -- Apply the `GtkWidgetNative` decorator with 
  -- the `gtk_application_window_new` C operation
  @GtkWidgetNative('gtk_application_window_new')
  Window
do -- Indent into a do block to domain into `Window


  --- Window::set_title ---
  -- A class method to set the title
  @GtkWidgetOperation({
    operation = 'gtk_window_set_title',
    cast = 'GtkWindow*',
    arguments = {false},
  })
  @GtkWidgetReturnSelf()
  function Window:set_title(title) end

  -- alternative:
  -- (title) 
  -- @GtkWidgetOperation({
  --   operation = 'gtk_window_set_title',
  --   cast = 'GtkWindow*',
  --   arguments = {false},
  -- })
  -- @GtkWidgetReturnSelf()
  -- Window:set_title => end


  --- Window::set_default_size ---
  -- A class method to set default width and height
  @GtkWidgetOperation({
    operation = 'gtk_window_set_default_size',
    cast = 'GtkWindow*',
    arguments = {false, false},
  })
  @GtkWidgetReturnSelf()
  function Window:set_default_size(width, height) end

  -- alternative:
  -- (width, height) 
  -- @GtkWidgetOperation({
  --   operation = 'gtk_window_set_default_size',
  --   cast = 'GtkWindow*',
  --   arguments = {false, false},
  -- })
  -- @GtkWidgetReturnSelf()
  -- Window:set_default_size => end

  --- Window::set_child ---
  -- Set the child of the window (typically to vbox or hbox)
  @GtkWidgetOperation({
    operation = 'gtk_window_set_child',
    cast = 'GtkWindow*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function Window:set_child(child) end
  
  -- alternative:
  -- (child) 
  -- @GtkWidgetOperation({
  --   operation = 'gtk_window_set_child',
  --   cast = 'GtkWindow*',
  --   arguments = {true},
  -- })
  -- @GtkWidgetReturnSelf()
  -- Window:set_child => end

  --- Window::show ---
  -- Make the window visible
  @GtkWidgetOperation({
    operation = 'gtk_widget_show',
    arguments = {false, false},
  })
  @GtkWidgetReturnSelf()
  function Window:show() end

end

return Window


