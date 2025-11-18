using {
  lulib { Gtk, "./FFI.lua" },
  lulib { Window, "./Gtk/Window.lua" },
  lulib { Box, "./Gtk/Box.lua" },
  lulib { Label, "./Gtk/Label.lua" },
}

Gtk.Window = Window
Gtk.Box = Box
Gtk.Label = Label

return Gtk