
local {
} ->
  @GtkWidgetNative('gtk_header_bar_new')
  @GtkWidgetWithOptions({}, 'gtk_header_bar', "GtkHeaderBar*")
  HeaderBar:GtkWidget
do

  function HeaderBar:init(o)
    if type(o) == "table" then
      if o.start then
        self:pack_start(o.start)
      end
      if o.end_ then
        self:pack_end(o.end_)
      end
    end
  end

  @GtkWidgetOperation({
    operation = 'gtk_header_bar_pack_start',
    cast = 'GtkHeaderBar*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function HeaderBar:pack_start(child)
    table.insert(self.children, child)
  end

  @GtkWidgetOperation({
    operation = 'gtk_header_bar_pack_end',
    cast = 'GtkHeaderBar*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function HeaderBar:pack_end(child)
    table.insert(self.children, child)
  end

end

return HeaderBar
