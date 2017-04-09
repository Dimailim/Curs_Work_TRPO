wordsquare={}
wordsquare.__index=wordsquare
extended (wordsquare, button)

function wordsquare:new(x, y, text, width, height)
	local t = {}
	t.x = x or 400
	t.y = y or 300
	t.char= text or "!"
	t.width = width or 40
	t.height = height or width or 40
	t.color = {255, 255, 255, 255}

	return setmetatable(t, {__index = self})
end

function wordsquare:draw()
	love.graphics.setColor(self.color)
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
	love.graphics.printf( self.char, self.x, self.y+self.height/2-mainFont:getHeight( )/2, self.width, "center" )

	if self.color[2] ~= 255 then
		love.graphics.line(self.x, self.y, self.x + self.width, self.y + self.height)
		love.graphics.line(self.x + self.width, self.y, self.x, self.y + self.height)
	end
end

function wordsquare:onClick(button)
	if button == 1 then
		self.color = {255, 0, 0, 255}
	else
		self.color = {255, 255, 255, 255}
	end
	text = text..self.char
	--throw char to logic
end