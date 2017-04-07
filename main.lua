function extended (child, parent)
	setmetatable(child,{__index = parent})
end

require("menu")
require("game")
require("human")
require("button")

function love.load(arg)
	--if arg[#arg] == "-debug" then require("mobdebug").start() end
	mainFont = love.graphics.newFont("arial.ttf", 20);
	state = MainMenu
	if state.load then state.load() end
end

function love.update(dt)
	--require("mobdebug").on()
	mx, my = love.mouse.getPosition( )
	if state.update then state.update(dt) end
	--require("mobdebug").off()
end

function love.draw()
	love.graphics.setFont(mainFont);
	love.graphics.setColor(255, 255, 255, 255)
	if state.draw then state.draw() end
end


function love.mousepressed(x, y, button, istouch)
	if state.mousepressed then state.mousepressed(x, y, button) end
end

function love.mousereleased(x, y, button)
	if state.mousereleased then state.mousereleased(x, y, button) end
end
