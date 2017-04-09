function extended (child, parent)
setmetatable(child,{__index = parent})
end

require("human")
require("button")
require("buttonmenu")
require("wordsquare")

function love.load(arg)
--if arg[#arg] == "-debug" then require("mobdebug").start() end
text= " "
mainFont = love.graphics.newFont("arial.ttf", 20);
h = human:new(400, 180, 0)
buttons= {}
kb = {
	{ 'Й', 'Ц', 'У', 'К', 'Е', 'Н', 'Г', 'Ш', 'Щ', 'З', 'Х', 'Ъ' },
	{ 'Ф', 'Ы', 'В', 'А', 'П', 'Р', 'О', 'Л', 'Д', 'Ж', 'Э' },
	{ 'Я', 'Ч', 'С', 'М', 'И', 'Т', 'Ь', 'Б', 'Ю' },
	size = 40,
	padding = 5,
	spacing = {
		120,
		153,
		198
	},
	top = 450
}

for i = 1, 3 do
	for j = 1, #kb[i] do
		b=button:new((kb.size + kb.padding) * (j - 1) + kb.spacing[i], (kb.size + kb.padding) * (i - 1) + kb.top, kb[i][j])
		table.insert(buttons,b)
		--print(b.x.." "..b.y)
	end
end

print(buttons[1].x.." "..buttons[1].y.." "..buttons[1].char)
print(buttons[32].x.." "..buttons[32].y.." "..buttons[32].char)
end

function love.update(dt)
--require("mobdebug").on()
mx, my = love.mouse.getPosition( )
--require("mobdebug").off()
end

function love.draw()
love.graphics.setFont(mainFont);
love.graphics.setColor(255, 255, 255, 255)
h:draw()
for i=1, #buttons do
	buttons[i]:draw()
end

love.graphics.print(text, 100, 500)
end


function love.mousepressed(x, y, button, istouch)
if button == 1 then -- the primary button

end

if button == 2 then

end
end

function love.mousereleased(x, y, button)
h.parts.number = (h.parts.number + 1) % 7

for i=1, #buttons do
		buttons[i]:mousereleased(x,y,button)
end

if button == 1 then

end

if button == 2 then

end

end
