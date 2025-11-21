local {
  @enum_index(0) Left,
  @enum_index(1) Right,
  @enum_index(2) Center,
  @enum_index(3) Fill,
} -< Justify

local {
  @enum_index(0) Word,
  @enum_index(1) Char,
  @enum_index(2) WordChar
} -< WrapMode

local {
  @enum_index(0) None,
  @enum_index(1) Start,
  @enum_index(2) Middle,
  @enum_index(3) End
} -< Ellipsize

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
    justify = gtk_option_mapper (Justify::index),

    wrap_mode = gtk_option_mapper (WrapMode::index),

    ellipsize = gtk_option_mapper (Ellipsize::index),

    selectable = -1,
    single_line_mode = -1,
    markup = -1,

    xalign = -1,
    yalign = -1,

    lines = -1,
  }, 'gtk_label', "GtkLabel*")
  Label
do
  
end

return Label
