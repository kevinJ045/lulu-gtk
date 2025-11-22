
local {
  @enum_index(0) Horizontal,
  @enum_index(1) Vertical
} -< @globalize GtkOrientation

local {
  @enum_index(0) SlideDown,
  @enum_index(1) SlideUp
} -< @globalize GtkRevealerTransition

local {
  @enum_index(0) Left,
  @enum_index(1) Right,
  @enum_index(2) Center,
  @enum_index(3) Fill,
} -< @globalize GtkJustify

local {
  @enum_index(0) Word,
  @enum_index(1) Char,
  @enum_index(2) WordChar
} -< @globalize GtkWrapMode

local {
  @enum_index(0) None,
  @enum_index(1) Start,
  @enum_index(2) Middle,
  @enum_index(3) End
} -< @globalize GtkEllipsize

local {
  @enum_index(0) Slide_LeftRight,
  @enum_index(1) Slide_RightLeft
} -< @globalize GtkStackTransition

local {
  @enum_index(0) Info,
  @enum_index(1) Warning,
  @enum_index(2) Error,
  @enum_index(3) Question,
  @enum_index(4) Other
} -< @globalize GtkMessageType
