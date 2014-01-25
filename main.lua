-- file: main.lua

-- data pool
require 'player'
require 'nais-cookies'
require 'bad-cukis'
require 'ingameMenu'
gamestate = require 'libs/gamestate'
--require 'gameover'
require 'intro'
require 'game' -- last

local lg,li,lw = love.graphics,love.image,love.window;

function love.load()
  -- lg.setIcon(ico);
  local ico = love.image.newImageData("assets/al4.png")
  lw.setIcon(ico)

  gamestate.registerEvents();
  gamestate.switch(intro);
end
