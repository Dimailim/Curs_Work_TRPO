Game = {}

function Game.load()
	text= " "
	h = human:new(400, 160, 0)
	buttons= {}
	kb = {
		keyboard = {
			{ 'Й', 'Ц', 'У', 'К', 'Е', 'Н', 'Г', 'Ш', 'Щ', 'З', 'Х', 'Ъ' },
			{ 'Ф', 'Ы', 'В', 'А', 'П', 'Р', 'О', 'Л', 'Д', 'Ж', 'Э' },
			{ 'Я', 'Ч', 'С', 'М', 'И', 'Т', 'Ь', 'Б', 'Ю' }
		},
		alphabet = {
			{ 'А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ж', 'З', 'И', 'Й', 'К', 'Л' },
			{ 'М', 'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц' },
			{ 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь', 'Э', 'Ю', 'Я' }
		},
		size = 40,
		padding = 5,
		spacing = {
			120,
			153,
			198
		},
		top = 400
	}

	--test buttons
	local f = function ()
		h.parts.number = 6
	end
	local b = button:new(10, 10, "Draw Human", 150, 50, f)
	table.insert(buttons, b)

	local g = function ()
		h.parts.number = 0
	end
	b = button:new(170, 10, "Erase Human", 150, 50, g)
	table.insert(buttons, b)

	ChoseKeyboard = kb.alphabet
	for i = 1, 3 do
		for j = 1, #ChoseKeyboard[i] do
			b=button:new((kb.size + kb.padding) * (j - 1) + kb.spacing[i], (kb.size + kb.padding) * (i - 1) + kb.top, ChoseKeyboard[i][j])
			table.insert(buttons, b)
		end
	end


end

function Game.update(dt)

end

function Game.draw()
	love.graphics.print(text, 0, 580)
	h:draw()
	for i=1, #buttons do
		buttons[i]:draw()
	end
end

function Game.mousepressed(x, y, button, istouch)

end

function Game.mousereleased(x, y, button)
	h.parts.number = (h.parts.number + 1) % 7

	for i=1, #buttons do
			buttons[i]:mousereleased(x,y,button)
	end
end