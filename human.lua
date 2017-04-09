human = {}

function human:new(x, y, p)
local t = {}
t.x = x or 400
t.y = y or 300
t.parts = {}
t.parts.number = p or 0
t.parts[1] = function()
  love.graphics.circle("line", t.x, t.y, 50, 50)
end
t.parts[2] = function()
  love.graphics.line(t.x, t.y + 50, t.x, t.y + 150)
end
t.parts[3] = function()
  love.graphics.line(t.x, t.y + 150, t.x - 50, t.y + 250)
end
t.parts[4] = function()
  love.graphics.line(t.x, t.y + 150, t.x + 50, t.y + 250)
end
t.parts[5] = function()
  love.graphics.line(t.x, t.y + 75, t.x - 75, t.y + 100)
end
t.parts[6] = function()
  love.graphics.line(t.x, t.y + 75, t.x + 75, t.y + 100)
end

return setmetatable(t,{__index = self})

end

function human:draw()

  for i = 1, self.parts.number do
    self.parts[i]()
  end
    love.graphics.line(self.x-100, 100, self.x-100, 400)
    love.graphics.line(400, 100, 300, 100)
    love.graphics.line(400, 100, 400, 130)
  --love.graphics.print("LOL", 100, 100)
  --love.graphics.rectangle("line",200,200,50,50)
end

