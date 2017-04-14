MainMenu = {}

function MainMenu.load()
	local width = love.graphics.getWidth( )
	local height = love.graphics.getHeight( )

	local f = function ()
		changeState(Game)
	end
	local w, h = 150, 50
	start = buttonmenu:new(width / 2 - w / 2, height / 2 - h / 2, "Старт", w, h, f)

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
		padding = 10,
		spacing = {
			120,
			153,
			198
		},
		top = 400
	}
	ChoseKeyboard = kb.alphabet
end
--
function MainMenu.update(dt)

end
--
function MainMenu.draw()
	start:draw()
end
--
function MainMenu.mousepressed(x, y, button, istouch)

end
--
function MainMenu.mousereleased(x, y, button)
	start:mousereleased(x,y,button)
end
--