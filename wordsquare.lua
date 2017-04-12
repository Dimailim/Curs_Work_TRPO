wordsquare={}
wordsquare.__index=wordsquare
extended (wordsquare, button)

function wordsquare:new(x, y, text, width, height)
	local t = {}
	t.x = x or 400
	t.y = y or 300
	t.char= text or " "
	t.width = width or 40
	t.height = height or width or 40
	t.color = {255, 255, 255, 255}

	return setmetatable(t, {__index = self})
end
--
function wordsquare:draw()
	love.graphics.setColor(self.color)
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
	love.graphics.printf( self.char, self.x, self.y+self.height/2-mainFont:getHeight( )/2, self.width, "center" )
end
--
function lengthWord(size)
	characters = {}
	local width = love.graphics.getWidth()
	local squareWidth = 40
	local padding = 5
	local spacing =(width - squareWidth * size - padding * (size - 1) ) / 2
	local top = 50
	for  i = 1 , size do
		characters[i] = wordsquare:new(spacing + (i - 1) * ( squareWidth + padding), top)
	end
end
--
function charpos(position, char)
	characters[position].char = char
end
--