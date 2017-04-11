Game = {}

function Game.load()
	text= " "
	h = human:new(400, 160, 0)
	buttons= {}

	--test buttons
	local f = function ()
		h.parts.number = 6
	end
	local b = buttonmenu:new(10, 10, "Нарисовать человечка", 250, 100, f)
	table.insert(buttons, b)

	local g = function ()
		h.parts.number = 0
	end
	b = buttonmenu:new(270, 10, "Стереть человечка", 250, 100, g)
	table.insert(buttons, b)
	--test buttons end

	ChoseKeyboard = kb.alphabet
	for i = 1, 3 do
		for j = 1, #ChoseKeyboard[i] do
			b = wordsquare:new((kb.size + kb.padding) * (j - 1) + kb.spacing[i], (kb.size + kb.padding) * (i - 1) + kb.top, ChoseKeyboard[i][j])
			table.insert(buttons, b)
		end
	end

	words = {	"АИСТ", "БЕЛКА", "ВАЗА", "ГИТАРА", "ДРОЗД", "ЕНОТ", "ЖУРАВЛЬ",
				"ЗОНТ", "ИНДЮК", "ЙОГУРТ", "КАРАСЬ", "ЛЕБЕДЬ", "МЯЧ", "НИТКИ", "ОКУНЬ",
				"ПИРАМИДА", "РЕДЬКА", "СОРОКА", "ТРУБА", "УТКА", "ФЛАГ", "ХЛЕБ", "ЦАПЛЯ",
				"ЧАЙКА", "ШАРИК", "ЩЕТКА", "ЭЛЬФ", "ЮЛА", "ЯБЛОКО"
	}
	generateWord()

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

function Game.mousepressed(x, y, button)

end

function Game.mousereleased(x, y, button)
	h.parts.number = (h.parts.number + 1) % 7

	for i=1, #buttons do
			buttons[i]:mousereleased(x, y, button)
	end
end

function generateWord()
	chosenWord = math.random(#words)
	--throw words[chosenWord] to build squares for word
end

function getChar(char)
	local flag = false
	for i, v in ipairs(words[chosenWord]) do
		if v == char then
			--throw right char (i, v)
			flag = true
		end
	end

	return flag
end