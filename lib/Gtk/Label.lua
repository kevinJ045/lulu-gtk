
local {
  @default_to("")
  #text,

  @default_to('left')
  #justify,
  @default_to('word')
  #wrap_mode,
  @default_to('none')
  #ellipsize,

  @default_to(false)
  #selectable,
  @default_to(false)
  #single_line_mode,
  @default_to(false)
  #wrap,

  @default_to(0.5)
  #xalign,
  @default_to(0.5)
  #yalign,

  @default_to(0)
  #lines,
} ->
  @GtkWidgetNative('gtk_label_new')
  @GtkWidgetWithOptions({
    text = 1,
    wrap = -1,
    justify = gtk_option_mapper (GtkJustify::index),

    wrap_mode = gtk_option_mapper (GtkWrapMode::index),

    ellipsize = gtk_option_mapper (GtkEllipsize::index),

    selectable = -1,
    single_line_mode = -1,
    markup = -1,

    xalign = -1,
    yalign = -1,

    lines = -1,
  }, 'gtk_label', "GtkLabel*")
  Label:GtkWidget
do

end

return Label
