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

	return setmetatable(t, {__index = self})
end

function button:draw()
	love.graphics.setColor(self.color)
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
	love.graphics.printf( self.char, self.x, self.y+self.height/2-mainFont:getHeight( )/2, self.width, "center" )
end

function button:onClick(button)
	print("Button:onClick used, when shouldn't")
end

function button:mousereleased(x, y, button)
	if x >= self.x and x <= self.x + self.width
	and y >= self.y and y <= self.y + self.height   then
		self:onClick(button)
	end
end

