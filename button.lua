button={}

function button:new(x, y, p)
  local t = {}
  t.x = x or 400
  t.y = y or 300
  t.char= p or "!"
  t.size = 40
  t.color = {255, 255, 255, 255}

  return setmetatable(t,{__index = self})
end

function button:draw()
	love.graphics.setColor(self.color)
	love.graphics.rectangle("line", self.x, self.y, self.size, self.size)
	love.graphics.printf( self.char, self.x, self.y+self.size/2-mainFont:getHeight( )/2, self.size, "center" )

	if self.color[2] ~= 255 then
		love.graphics.line(self.x, self.y, self.x + self.size, self.y + self.size)
		love.graphics.line(self.x + self.size, self.y, self.x, self.y + self.size)
	end

end

function button:mousereleased(x, y, button)
	if x >= self.x and x <= self.x + self.size
	and y >= self.y and y <= self.y + self.size   then
		if button == 1 then
			self.color = {255, 0, 0, 255}
			text=text..self.char
		else
			self.color = {255, 255, 255, 255}
		end
	end

end

