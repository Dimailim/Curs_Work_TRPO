button={}
button.__index=button

require("buttonmenu")
require("wordsquare")

function button:new(x, y, text, width, height)
	local t = {}
	t.x = x or 400
	t.y = y or 300
	t.char= text or "!"
	t.width = width or 40
	t.height = height or width or 40
	t.color = {255, 255, 255, 255}
	t.pressed = false
	t.mouse = false

	return setmetatable(t, {__index = self})
end
--
function button:update(dt)
		if x > self.x and x < self.x + self.width and y > self.y and y < self.y + self.height then
			self.mouse = true
		else
			self.mouse = false
		end
end
--
function button:draw()
	if self.mouse then
	love.graphics.setColor( 100, 100, 100, 255 )
	love.graphics.rectangle( "fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor( self.color )
	love.graphics.rectangle( "line", self.x, self.y, self.width, self.height)
	love.graphics.printf(self.char, self.x, self.y+self.height/2-mainFont:getHeight( )/2, self.width, "center") 
	else
	love.graphics.setColor(self.color)
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)

	local s = 5
	love.graphics.line(	self.x + self.width, self.y,
						self.x + self.width + s, self.y + s,
						self.x + self.width + s, self.y + self.height + s,
						self.x + s, self.y + self.height + s,
						self.x, self.y + self.height)
	love.graphics.line(	self.x + self.width, self.y + self.height, self.x + self.width + s, self.y + self.height + s)

	love.graphics.printf( self.char, self.x, self.y+self.height/2-mainFont:getHeight( )/2, self.width, "center" )

	if self.color[2] ~= 255 then
		love.graphics.line(self.x, self.y, self.x + self.width, self.y + self.height)
		love.graphics.line(self.x + self.width, self.y, self.x, self.y + self.height)
	end

	if self.color[1] ~= 255 then
		love.graphics.circle("line", self.x + self.width / 2, self.y + self.height / 2, math.min(self.width, self.height) / 2, 32)
	end
	end
end
--
function button:onClick(button)
	local flag = getChar(self.char)
	if flag then
		--char was right
		self.color = {0, 255, 0, 255}
	else
		--chat wasn't right'
		self.color = {255, 0, 0, 255}
		h.parts.number = (h.parts.number + 1) % 7
		if(h.parts.number == 6 ) then
			changeState(MainMenu) -- Loose Screen
		end
	end
end
--
function button:mousepressed(x, y, button)
	if 	x >= self.x and x <= self.x + self.width
	and y >= self.y and y <= self.y + self.height then
		self.pressed = true
	else
		self.pressed = false
	end
end
--
function button:mousereleased(x, y, button)
	if  x >= self.x and x <= self.x + self.width
	and y >= self.y and y <= self.y + self.height
	and self.pressed then
		self:onClick(button)
	end
end
--
