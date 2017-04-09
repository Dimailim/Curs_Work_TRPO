MainMenu = {}

function MainMenu.load()
	local width = love.graphics.getWidth( )
	local height = love.graphics.getHeight( )

	local f = function ()
		state = Game
		state.load()
	end
	local w, h = 150, 50
	start = button:new(width / 2 - w / 2, height / 2 - h / 2, "Start", w, h, f)
end

function MainMenu.update(dt)

end

function MainMenu.draw()
	start:draw()
end

function MainMenu.mousepressed(x, y, button, istouch)

end

function MainMenu.mousereleased(x, y, button)
	start:mousereleased(x,y,button)
end