-- cookies.lua for cookies and anti cookies (which are also cookies, but they are evil i tell you. eeeevil)

require 'libs/bbox';

local lg = love.graphics;
-- cookie images (vegetables would make some cool enemiesthough)
local gudcuki = lg.newImage("assets/nais-cookie.png");
local gudcukiWidth, gudcukiHeight = gudcuki:getWidth(), gudcuki:getHeight();
local cookiInfo = { 250, 0, .05, 0 }  
local vx, vy, scale, rot = unpack(cookiInfo);

local pcooki = {}
local pTimer, pTimerSpeed, pTimerStart = 12,1,{}
for i=1,4 do pTimerStart[i] = 0; end -- make 4 starting points for timers 

local eTimer, eTimerSpeed, eTimerStart = 1,1,0;
local eating = false;
local str, r,g,b = "*GULP* DELICIOUS!",255,0,0;

function pcooki_set(x,y)
  table.insert(pcooki, { x=x, y=y })
end
function cuki_gen(dt) -- gen cukis 
  for i=1,3 do 
    pTimerStart[i] = pTimerStart[i] + pTimerSpeed*dt;
    
    if pTimerStart[i] >= pTimer/i then -- generate cooki  
      pcooki_set(lg.getWidth(), (lg.getHeight()*i)/4 - 35)
      pTimerStart[i] = 0
    end -- start counting up again separately  
  end
end
function pcooki_regulate(dt) -- regulates existing gud cukis when in gamestate game (movement and remove stuff)
  for i,v in ipairs(pcooki) do
      v.x = v.x - (vx*dt)
      if v.x < 0-gudcukiWidth then table.remove(pcooki, i) end
  end
end
function pcooki_draw()
  for i,v in ipairs(pcooki) do lg.draw(gudcuki, v.x, v.y, rot, scale) end
end
function player_detectGudCuki() -- increase score and remove gud cukis
  for i,v in ipairs(pcooki) do
    if CheckCollision(alistair.x, alistair.y, alistair.w/2, alistair.h/2, v.x, v.y, gudcukiWidth*.05, gudcukiHeight*.05) then
      alistair.score = alistair.score + 1;
      eating = not eating;
      table.remove(pcooki, i);
    end
  end
end
function cuki_dericious() -- to make things even more messy ヽ(゜Q。)ノ？
  if eating then
    lg.setColor(r-255,g,b+255);
    lg.print(str,alistair.x+alistair.w/4, alistair.y+alistair.h*1.5); 
    lg.setColor(r,g+255,b);
  end
end
function player_changeImg(dt) -- is called when eating cuki. mouth is closed for about 2 seconds
  if eating then 
    eTimerStart = eTimerStart + eTimerSpeed*dt;
    alistair.img = alistair.closedImg; 
    if eTimerStart >= eTimer then 
      alistair.img = alistair.img2;
      eTimerStart = 0;
      eating = not eating;
    end
  end
end
--[[function cuki_boost(dt)
  for i=1,5 do
    if alistair.score == 10*i then vx = vx+i/2; end 
  end
end--]]
