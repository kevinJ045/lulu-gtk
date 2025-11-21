using {
  lulib { Gtk, "./lib/Gtk.lua" }
}

local callbacks = {}

local state = Gtk.State("haha")
local state2 = Gtk.State("horizontal")

local activate_cb = ffi.cast("GCallback",
  function(app, user_data)
    local win = Gtk.Window(app)
    win:set_title("hello")
    win:set_default_size(400, 200)

    local vbox = Gtk.Box {
      orientation = state2,
      children = {
        Gtk.Label { text = "sksks" },
        Gtk.Label { text = "works" }
      }
    }

    state2:set("vertical")

    local label = Gtk.Label({
      markup = state,
      selectable = true,
      justify = "right"
    })

    state:set("<b>nooo</b>")

    local button = Gtk.Button {
      child = label
    }

    button:connect("clicked", function()
      print("hii")
    end)

    vbox:append(button)

    print(vbox.children:len())

    win:set_child(vbox)

    win:show()
  end
)
callbacks.activate = activate_cb

local app = Gtk.ffi.gtk_application_new("org.b.c", 0)

Gtk.ffi.g_signal_connect_data(app, "activate", activate_cb, nil, nil, 0)

Gtk.ffi.g_application_run(ffi.cast("GApplication*", app), 0, nil)