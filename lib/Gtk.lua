using {
  lulib { Gtk, "./FFI.lua" },
  lulib { Enums, "./Gtk/Enums.lua" },
  lulib { Window, "./Gtk/Window.lua" },
  lulib { Box, "./Gtk/Box.lua" },
  lulib { Label, "./Gtk/Label.lua" },
  lulib { Button, "./Gtk/Button.lua" },
  lulib { HeaderBar, "./Gtk/HeaderBar.lua" },
  lulib { CheckButton, "./Gtk/CheckButton.lua" },
  lulib { Frame, "./Gtk/Frame.lua" },
  lulib { Image, "./Gtk/Image.lua" },
  lulib { ScrolledWindow, "./Gtk/ScrolledWindow.lua" },
  lulib { TextView, "./Gtk/TextView.lua" },
  lulib { Entry, "./Gtk/Entry.lua" },
  lulib { Switch, "./Gtk/Switch.lua" },
  lulib { Grid, "./Gtk/Grid.lua" },
  lulib { ListBox, "./Gtk/ListBox.lua" },
  lulib { ListBoxRow, "./Gtk/ListBoxRow.lua" },
  lulib { Revealer, "./Gtk/Revealer.lua" },
  lulib { Stack, "./Gtk/Stack.lua" },
  lulib { StackSidebar, "./Gtk/StackSidebar.lua" },
  lulib { Separator, "./Gtk/Separator.lua" },
  lulib { Spinner, "./Gtk/Spinner.lua" },
  lulib { InfoBar, "./Gtk/InfoBar.lua" },
  lulib { AspectFrame, "./Gtk/AspectFrame.lua" },
  lulib { Calendar, "./Gtk/Calendar.lua" },
  lulib { LinkButton, "./Gtk/LinkButton.lua" },
}

Gtk.Window = Window
Gtk.Box = Box
Gtk.Label = Label
Gtk.Button = Button
Gtk.HeaderBar = HeaderBar
Gtk.CheckButton = CheckButton
Gtk.Frame = Frame
Gtk.Image = Image
Gtk.ScrolledWindow = ScrolledWindow
Gtk.TextView = TextView
Gtk.Entry = Entry
Gtk.Switch = Switch
Gtk.Grid = Grid
Gtk.ListBox = ListBox
Gtk.ListBoxRow = ListBoxRow
Gtk.Revealer = Revealer
Gtk.Stack = Stack
Gtk.StackSidebar = StackSidebar
Gtk.Separator = Separator
Gtk.Spinner = Spinner
Gtk.InfoBar = InfoBar
Gtk.AspectFrame = AspectFrame
Gtk.Calendar = Calendar
Gtk.LinkButton = LinkButton

return Gtk
