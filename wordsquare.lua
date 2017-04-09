wordsquare={}

function wordsquare:new(x,y,p)
 local s = {}
  s.x = x or 400
  s.y = y or 300
  s.char= p or "!"
  s.size = 40
  s.color = {255, 255, 255, 255}

  return setmetatable(t,{__index = self})
end	
function wordsquare:draw()
	love.graphics.setColor(self.color)
	love.graphics.rectangle("line", self.x, self.y, self.size, self.size)
	love.graphics.printf( self.char, self.x, self.y+self.size/2-mainFont:getHeight( )/2, self.size, "center" )
end
