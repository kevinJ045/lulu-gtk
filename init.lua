using {
  lulib { Gtk, "./lib/Gtk.lua" }
}

local callbacks = {}

local activate_cb = ffi.cast("GCallback",
  function(app, user_data)
    local win = Gtk.Window(app)
    win:set_title("hello")
    win:set_default_size(400, 200)

    local vbox = Gtk.Box()

    local label1 = Gtk.Label("sksks")
    local label2 = Gtk.Label("works")

    vbox:append(label1)
    vbox:append(label2)

    win:set_child(vbox)

    win:show()
  end
)
callbacks.activate = activate_cb

local app = Gtk.ffi.gtk_application_new("org.b.c", 0)

Gtk.ffi.g_signal_connect_data(app, "activate", activate_cb, nil, nil, 0)

Gtk.ffi.g_application_run(ffi.cast("GApplication*", app), 0, nil)
