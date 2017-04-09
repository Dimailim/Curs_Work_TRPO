buttonmenu = {} 

buttonmenu.__index=buttonmenu

extended (buttonmenu, button)

function buttonmenu:new(x,y,p)
	local t =  button:new(x,y,p)
  return setmetatable(t,{__index = self})
end
function buttonmenu:draw() 
	love.graphics.setColor(self.color)
	love.graphics.rectangle("line", self.x, self.y, self.size, self.size)
	love.graphics.printf( self.char, self.x, self.y+self.size/2-mainFont:getHeight( )/2, self.size, "center" )
end
