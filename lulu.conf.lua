manifest = {
  name = "lulu-gtk",
  version = "0.1.0"
}

mods = {
  init = "init.lua"
}

fetch = "code"

build = function()
  resolve_dependencies()
  bundle_main("init.lua", true)
  print('Built binary to ".lib" folder.')
end
