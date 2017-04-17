Game = {}

function Game.load()
	text = " "
	h = human:new(600, 160, 0)
	buttons= {}

	--test buttons
	local f = function ()
		changeState(MainMenu)
	end
	local b = buttonmenu:new(690, 10, "В меню", 100, 50, f)
	table.insert(buttons, b)
	--test buttons end

	for i = 1, #ChoseKeyboard do
		for j = 1, #ChoseKeyboard[i] do
			b = button:new((kb.size + kb.padding) * (j - 1) + kb.spacing[i], (kb.size + kb.padding) * (i - 1) + kb.top, ChoseKeyboard[i][j])
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
--
function Game.update(dt)

end
--
function Game.draw()
	love.graphics.print(text, 0, 580)
	h:draw()
	for i = 1, #buttons do
		buttons[i]:draw()
	end

	for i = 1, #characters do
		characters[i]:draw()
	end

end
--
function Game.mousepressed(x, y, button)
	for i = 1, #buttons do
		buttons[i]:mousepressed(x, y, button)
	end
end
--
function Game.mousereleased(x, y, button)
	for i = 1, #buttons do
		buttons[i]:mousereleased(x, y, button)
	end
end
--
function generateWord()
	math.randomseed(os.time())
	chosenWord = math.random(#words)
	text = words[chosenWord]
	lengthWord(string.len(words[chosenWord]) / 2)
end
--
function getChar(char)
	local flag = false
	local s = 0
	repeat
		s = string.find(words[chosenWord], char, s + 1)
		if s ~= nil then
			flag = true
			charpos(math.floor(s / 2) + 1, char)
		end
	until s == nil

	return flag
end
--
