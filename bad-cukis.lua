-- enemies.lua (the bad cookies!)

require 'libs/bbox';

local lg = love.graphics;
local badCukInf,badCukImg = { 275, 0, 0, .05 }, lg.newImage("assets/bad-cuki.png") 
local vx, vy, rot, scale = unpack(badCukInf) 

local badCukiRightLeft,badCukiTopBottom = {},{} -- hold teh cukis
local createTimer, cTimerSpeed, cTimerStart, cTimerStart2 = 20,1, { 0, 0 }, { 0,0,0,0 }
local atkStr, atkStr2 = "ME EAT YOU!!", "AAAH"

function badCuki_setPos(x,y)
  table.insert(badCukiRightLeft, { x=x, y=y })
  table.insert(badCukiTopBottom, { x=x, y=y})
end
function badCuki_gen(dt)
  -- right to left
  for i=1,2 do
    cTimerStart[i] = cTimerStart[i] + cTimerSpeed*dt
    
    if cTimerStart[i] >= createTimer/i then 
      badCuki_setPos(lg.getWidth(), (lg.getHeight()-50)*i/2.5)
      cTimerStart[i] = 0
    end
  end
  -- top to bottom
  for i=1,4 do
    cTimerStart2[i] = cTimerStart2[i] + cTimerSpeed*dt

    if cTimerStart2[i] >= 40/i then
      badCuki_setPos(lg.getWidth()/i*1.5,0)
      cTimerStart2[i] = 0
    end
  end
end
function badCuki_reMove(dt) -- remove and move
  for i,v in ipairs(badCukiRightLeft) do
    v.x = v.x - (vx*dt)
    if v.x < 0-badCukImg:getWidth() then table.remove(badCukiRightLeft, i) end
  end
  for i,v in ipairs(badCukiTopBottom) do 
    v.y = v.y + (vx*dt) -- just imagine vy = vx
    if v.y > lg.getHeight() then table.remove(badCukiTopBottom, i) end
  end
end
function badCuki_draw()
  for i,v in ipairs(badCukiRightLeft) do 
    lg.draw(badCukImg, v.x, v.y, rot, scale) 
    lg.print(atkStr2, v.x, v.y+42)
  end
  for i,v in ipairs(badCukiTopBottom) do 
    lg.draw(badCukImg, v.x, v.y, rot, scale) 
    lg.print(atkStr, v.x - 150, v.y+10)
  end
end
function drawTest()
--  lg.draw(badCukImg, 250,250,rot,scale)
end
