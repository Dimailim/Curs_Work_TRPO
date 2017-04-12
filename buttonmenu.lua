buttonmenu = {}
buttonmenu.__index=buttonmenu
extended (buttonmenu, button)

function buttonmenu:new(x, y, text, width, height, f)
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
end
--
function buttonmenu:draw()
	love.graphics.setColor(self.color)
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
	love.graphics.printf( self.char, self.x, self.y+self.height/2-mainFont:getHeight( )/2, self.width, "center" )
end
--