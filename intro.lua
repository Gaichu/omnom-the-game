-- intro.lua beware of the anti cookies!!!

intro = gamestate.new();

local lg = love.graphics;
local timer, timerSpeed, timerStart = 5,1,0;
local warningTxt, warningTxt1, cookiTxt = 'Collect the cookies, but avoid the evil ones. They are evil I tell you. eeeevil.', 'They want to eat YOU!', 'a ton of cookies were harmed in the making of this game';
local rgb = {255, 0, 0} -- just testing
local r,g,b = unpack(rgb);
local cukiGod, gaichu, rot, scale = lg.newImage("assets/cukiGod.png"), lg.newImage("assets/gaichu.png"), 0, 0.25;
local creatorTxt = {"Cookie God", "Code Monkey" } 

function intro:draw()
  lg.print(warningTxt, lg.getWidth()/10, lg.getHeight()/3.75);
  lg.setColor(r,g,b);
  lg.print(warningTxt1 .. "   " .. timer - math.floor(timerStart), lg.getWidth()/4.5, lg.getHeight()/2.5);
  lg.setColor(r, g+255, b+255);
  lg.print(cookiTxt, lg.getWidth()/4.5, lg.getHeight()-75);
  lg.draw(cukiGod, 0+lg.getWidth()/7, lg.getHeight()/2, rot, scale);
  lg.draw(gaichu, 0+lg.getWidth()/7+cukiGod:getWidth()*1.45, lg.getHeight()/2, rot, scale);
  lg.setColor(r,g,b+255); -- we're transmitting fashionable eye cancer here
  for i=1,#creatorTxt do lg.print(creatorTxt[i], 0+lg.getWidth()/9+i*200, lg.getHeight()/2+20); end
  lg.setColor(r, g+255, b+255); 
end
function intro:update(dt)
  timerStart = timerStart + (timerSpeed*dt);
  if timerStart >= timer+0.99 then
    timerStart = 0;
    gamestate.switch(game);
  end
end
function intro:keyreleased(key)
  if key == 'return' then gamestate.switch(game); end 
end
