-- file: game.lua, the actual functions needed

game = gamestate.new();

local lg = love.graphics;
local font = lg.newFont("fonts/PixAntiqua.ttf", 25);
lg.setFont(font);

function game:init()
  alistair:init();
  alistair:init_head();
--  alistair:init_boost(); -- not implemented yet
--  alistair:timer_init();
  ingameMenu_init();
-- ...
end
function game:draw()
  lg.setColor(255, 255, 255);
  alistair:draw(); -- nom nom! 
  pcooki_draw(); -- draw tasty cukis! ( ´ ▽ ` )ﾉ
  cuki_dericious() -- mhhhh... 
--  alistair:draw_textHappy();
  if ingameMenuOpen then ingameMenu_draw(); end
-- ...
end
function game:update(dt)
  if not ingameMenuOpen then 
    alistair:update(dt);
    cuki_gen(dt); -- gen good cukis
    pcooki_regulate(dt);
    player_detectGudCuki(); -- for score and remove stuff
--    cuki_boost(dt);
    player_changeImg(dt);
--    alistair:detect_higherScore();
--    alistair:timer(dt);
  end
-- ...
end
function game:keyreleased(key)
  ingameMenu_keyreleased(key);
  intro:keyreleased(key); 
end
