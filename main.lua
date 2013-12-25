-- file: main.lua

-- data pool
require 'player';
require 'cookies';
require 'ingameMenu';
gamestate = require 'libs/gamestate';
--require 'gameover';
require 'intro';
require 'game'; -- last

local lg = love.graphics;
-- local ico = lg.newImage("assets/bla.png");
function love.load()
  -- lg.setIcon(ico);
  gamestate.registerEvents();
  gamestate.switch(intro);
end
