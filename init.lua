
using {
  lulib { Gtk, "./lib/Gtk.lua" }
}

local callbacks = {}

local activate_cb = ffi.cast("GCallback",
  function(app, user_data)
    local win = Gtk.Window(app)
    win:set_title("Widget Test")
    win:set_default_size(800, 600)

    print('window made')

    local grid = Gtk.Grid {
      row_spacing = 10,
      column_spacing = 10,
      margin_top = 10,
      margin_bottom = 10,
      margin_start = 10,
      margin_end = 10,
    }

    print('grid made')

    -- HeaderBar
    local header = Gtk.HeaderBar()
    grid:attach(header, 0, 0, 2, 1)

    print('header made')

    -- CheckButton
    local check_button = Gtk.CheckButton { label = "Check Me" }
    grid:attach(check_button, 0, 1, 1, 1)

    print('check button made')

    -- Frame
    local frame = Gtk.Frame {
      label = "A Frame",
      child = Gtk.Label { text = "Inside the frame" }
    }
    grid:attach(frame, 1, 1, 1, 1)

    -- Image
    -- Note: This will only work if you have this icon on your system
    -- local image = Gtk.Image { icon_name = "dialog-information", pixel_size = 48 }
    -- grid:attach(image, 0, 2, 1, 1)

    -- Entry
    local entry = Gtk.Entry { placeholder_text = "Enter text here" }
    grid:attach(entry, 1, 2, 1, 1)

    -- Switch
    local switch = Gtk.Switch()
    grid:attach(switch, 0, 3, 1, 1)

    -- ListBox
    local list_box = Gtk.ListBox()
    list_box:append(Gtk.ListBoxRow { child = Gtk.Label { text = "Row 1" } })
    list_box:append(Gtk.ListBoxRow { child = Gtk.Label { text = "Row 2" } })
    grid:attach(list_box, 1, 3, 1, 1)

    -- Revealer
    local revealer_button = Gtk.Button { label = "Reveal" }
    local revealer = Gtk.Revealer {
      child = Gtk.Label { text = "Revealed!" },
      transition_type = Gtk.RevealerTransitionType.SLIDE_DOWN
    }
    revealer_button:connect("clicked", function()
      revealer:set_reveal_child(not revealer:get_reveal_child())
    end)
    grid:attach(revealer_button, 0, 4, 1, 1)
    grid:attach(revealer, 1, 4, 1, 1)

    -- Stack and StackSidebar
    local stack = Gtk.Stack {
      transition_type = Gtk.StackTransitionType.SLIDE_LEFT_RIGHT,
      children = {
        { widget = Gtk.Label { text = "Page 1" }, name = "page1", title = "Page 1" },
        { widget = Gtk.Label { text = "Page 2" }, name = "page2", title = "Page 2" },
      }
    }
    local stack_sidebar = Gtk.StackSidebar { stack = stack }
    grid:attach(stack_sidebar, 0, 5, 1, 1)
    grid:attach(stack, 1, 5, 1, 1)

    -- Separator
    local separator = Gtk.Separator { orientation = Gtk.Orientation.HORIZONTAL }
    grid:attach(separator, 0, 6, 2, 1)

    -- Spinner
    local spinner = Gtk.Spinner()
    spinner:start()
    grid:attach(spinner, 0, 7, 1, 1)

    -- InfoBar
    local info_bar = Gtk.InfoBar {
      message_type = Gtk.MessageType.INFO,
      show_close_button = true,
      child = Gtk.Label { text = "This is an info bar." }
    }
    grid:attach(info_bar, 1, 7, 1, 1)

    -- AspectFrame
    local aspect_frame = Gtk.AspectFrame {
      ratio = 1.0,
      xalign = 0.5,
      yalign = 0.5,
      child = Gtk.Label { text = "1:1" }
    }
    grid:attach(aspect_frame, 0, 8, 1, 1)

    -- Calendar
    local calendar = Gtk.Calendar()
    grid:attach(calendar, 1, 8, 1, 1)

    -- LinkButton
    local link_button = Gtk.LinkButton {
      uri = "https://www.gtk.org",
      label = "Visit GTK Website"
    }
    grid:attach(link_button, 0, 9, 2, 1)

    -- ScrolledWindow with TextView
    local scrolled_window = Gtk.ScrolledWindow()
    local text_view = Gtk.TextView()
    local buffer = text_view:get_buffer()
    buffer:set_text("This is a TextView inside a ScrolledWindow.", -1)
    scrolled_window:set_child(text_view)
    grid:attach(scrolled_window, 0, 10, 2, 1)


    local scrolled_win_main = Gtk.ScrolledWindow()
    scrolled_win_main:set_child(grid)
    win:set_child(scrolled_win_main)

    win:show()
  end
)
callbacks.activate = activate_cb

local app = Gtk.ffi.gtk_application_new("org.b.c", 0)

Gtk.ffi.g_signal_connect_data(app, "activate", activate_cb, nil, nil, 0)

Gtk.ffi.g_application_run(ffi.cast("GApplication*", app), 0, nil)
