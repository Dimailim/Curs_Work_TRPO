button={}
<<<<<<< HEAD

function button:new(x, y, text, width, height, f)
	local t = {}
	t.x = x or 400
	t.y = y or 300
	t.char= text or "!"
	t.width = width or 40
	t.height = height or width or 40
	t.color = {255, 255, 255, 255}

	if f ~= nil then
		t.onClick = f
	end

	return setmetatable(t, {__index = self})
=======
button.__index=button
function button:new(x, y, p)
  local t = {}
  t.x = x or 400
  t.y = y or 300
  t.char= p or "!"
  t.size = 40
  t.color = {255, 255, 255, 255}

  return setmetatable(t,{__index = self})
>>>>>>> refs/remotes/origin/master
end

function button:draw()
	love.graphics.setColor(self.color)
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
	love.graphics.printf( self.char, self.x, self.y+self.height/2-mainFont:getHeight( )/2, self.width, "center" )

	if self.color[2] ~= 255 then
		love.graphics.line(self.x, self.y, self.x + self.width, self.y + self.height)
		love.graphics.line(self.x + self.width, self.y, self.x, self.y + self.height)
	end

end

function button:onClick(button)
	if button == 1 then
		self.color = {255, 0, 0, 255}
	else
		self.color = {255, 255, 255, 255}
	end
	text = text..self.char
	--throw char to logic
end

function button:mousereleased(x, y, button)
	if x >= self.x and x <= self.x + self.width
	and y >= self.y and y <= self.y + self.height   then
		self:onClick(button)
	end
end

