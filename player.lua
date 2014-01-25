-- alistair cookie. he sure looooves cooookies! cookie! cookie!

local class = require 'libs/class';

alistair = class:new();
local lg, lk = love.graphics, love.keyboard;
--local meLikeInf = { "IM SOOO HUNGRY", "ME LIKE TASTY COOKIES!", "OM NOM NOM NOM", "GIVE ME MOAR COOKIES!", 
--"I WANT MOOOOOOOOOAR" }
local txtTimer, txtTimerSpeed, txtTimerStart = 2.5,1,0;
local triggered, countTrigger = false, 1; -- trigger meLikeInf strings and print them to screen. increment index with countTrigger 

function alistair:init()
  self.img, self.closedImg = lg.newImage("assets/al4.png"), lg.newImage("assets/al4_eating.png"); 
  self.img2 = lg.newImage("assets/al4.png"); -- chorry! 
  self.x, self.y, self.w, self.h = lg.getWidth()/25, lg.getHeight()/2, self.img:getWidth(), self.img:getHeight();
  self.vx, self.vy = 200, 250;
  self.score, self.gain, self.lives = 0, 15, 5;
  self.rot, self.scale = 0,1;
end
function alistair:init_head()
  self.heads = {} -- table containing the n lifes of alistair
  for i=1,3 do self.heads[i] = i; end
  self.imgScoreHead = self.img;
  self.rotScoreHead, self.scaleScoreHead = self.rot, self.scale*.45;
end
function alistair:init_boost() -- not implemented yet..
  self.isActive = false;
  self.txt = { "inactive", "active" } 
  self.active, self.inactive = unpack(self.txt);
end
function alistair:draw()
  lg.draw(self.img, self.x, self.y, self.rot, self.scale);
  alistair:draw_stats();
--  alistair:draw_boost();
  alistair:draw_score(); 
end
function alistair:draw_score() -- in relation to how many cookies you have already eaten
  lg.print("SCORE " .. math.floor(self.score), lg.getWidth()/4, lg.getHeight()-self.img:getHeight());
end
--[[ not really working now
function alistair:detect_higherScore()
  if self.score%5 == 0 and self.score > 0 then 
    triggered = true;--not triggered;
    print(triggered)
  end
end 
function alistair:timer(dt) 
  if triggered then
    txtTimerStart = txtTimerStart + txtTimerSpeed*dt;
    
    if txtTimerStart >= txtTimer then
      txtTimerStart = 0;
      triggered = false;--not triggered
      countTrigger = countTrigger + 1;
      if countTrigger >= #meLikeInf then countTrigger = 1; end -- start again with printing texts 
    end
  end    
end --]]
function alistair:draw_textHappy()
  if triggered then lg.print(meLikeInf[countTrigger], self.x-self.w/2,self.y-self.h/2) end
end
function alistair:draw_meSad()
  -- implement function for expression of alistair when hit by an enemy
end
function alistair:draw_stats() -- draw little alistairs showing lifes
  lg.rectangle('line', 0, lg.getHeight()-75, lg.getWidth(), lg.getHeight()-75) 
  lg.print("LIFES ", 20, lg.getHeight()-self.img:getHeight())
  for i=1,#self.heads do lg.draw(self.imgScoreHead, 75+lg.getWidth()/7*i/4, lg.getHeight()-self.img:getHeight()+5, self.rotScoreHead, self.scaleScoreHead) end
  lg.print("(P)AUSE", lg.getWidth()/2.5, lg.getHeight()-self.img:getHeight())
end
--[[function alistair:draw_boost()
  lg.print("BOOST ", lg.getWidth()/2.5, lg.getHeight()-self.img:getHeight());
  if isActive then lg.print(self.inactive, lg.getWidth()/2.0175, lg.getHeight()-self.img:getHeight()); 
  else lg.print(self.active, lg.getWidth()/2.0175, lg.getHeight()-self.img:getHeight()); end
end--]]
function alistair:move(dt) -- just walking around
  if lk.isDown('d', 'right') then self.x = self.x + self.vx*dt
  elseif lk.isDown('a', 'left') then self.x = self.x - self.vx*dt end
  if self.x >= lg.getWidth()-self.w then self.x = lg.getWidth()-self.w
  elseif self.x <= 0 then self.x = 0 end
  if lk.isDown('w', 'up') then self.y = self.y - self.vy*dt
  elseif lk.isDown('s', 'down') then self.y = self.y + self.vy*dt end
  if self.y <= 0 then self.y = 0;
  elseif self.y >= lg.getHeight()-self.h then self.y = lg.getHeight()-self.h end
end
function alistair:collisionOnPanel(dt)
  if self.y > lg.getHeight()-self.img:getHeight()-self.h*1.11 then self.y = lg.getHeight()-self.img:getHeight()-self.h*1.11 end 
end
function alistair:update(dt)
  alistair:move(dt)
  alistair:collisionOnPanel(dt)
end
