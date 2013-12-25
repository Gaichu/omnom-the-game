-- file: conf.lua
--
function love.conf(t)
  t.window.width = 1024
  t.window.height = 468
  t.version = "0.9.0"
  t.title = "omnom" -- om nom nom nom!
  t.vsync = true
  t.fsaa = 0
  t.display = 1
  t.modules.audio = true
  t.modules.event = true
  t.modules.graphics = true
  t.modules.image = true
  t.modules.keyboard = true
  t.modules.mouse = true
  t.modules.physics = false
  t.modules.window = true
  t.url = "https://github.com/Gaichu" 
  t.console = false
end
