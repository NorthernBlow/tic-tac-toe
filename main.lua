--[[
Крестики-нолики

Автор: Святослав Рэинхарт
evolution.is.not.theory@gmail.com

]]


-- библиотеки

local push = require "push"


-- JUST BECAUSE I LUVE AETHETIC
VIRTUAL_WIDTH = 240
VIRTUAL_HEIGHT = 320

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

MAP_HEIGHT, MAP_WIDTH = 3, 3
MAP_TALE_SIZE = 40


-- подгружаем изображения

local xSprite = love.graphics.newImage('graphics/crest.png')
local oSprite = love.graphics.newImage('graphics/zero.png')

-- структуры данных

local map = {
  {"","",""},
  {"","",""},
  {"","",""}
  }
  


function love.load()
  -- добавил немного размытия для более красивого отображения пикселей
  love.graphics.setDefaultFilter('nearest', 'nearest')
  
  love.window.setTitle('Крестики-Нолики')
  push:setupScreen(VIRTUAL_HEIGHT, VIRTUAL_WIDTH, WINDOW_WIDTH, WINDOW_HEIGHT, {
      fullscreen = false,
      vsync = true,
      resizeble = true
      })
end



function love.keypressed(key)
  -- если нажатая клавиша esc, то выключает игру
  if key == 'escape' then
    love.event.quit()
    end

end


function love.update(dt)
  
  
end


function drawMap()
  -- создаем сетку 3 х 3
  local xMargin = VIRTUAL_WIDTH - (MAP_TALE_SIZE * 3) -- 240 - 120 = 120
  local yMargin = VIRTUAL_HEIGHT - (MAP_TALE_SIZE * 3) -- 320 - 120 = 200
  
  -- первая вертикальная линия
  love.graphics.line(xMargin / 2 + MAP_TALE_SIZE, yMargin / 2,
    xMargin / 2 + MAP_TALE_SIZE, VIRTUAL_HEIGHT - yMargin / 2) -- x1=100, y1=100, x2=140, y2=220
  
  -- вторая вертикальная линия
  
  love.graphics.line(VIRTUAL_WIDTH - xMargin / 2 - MAP_TALE_SIZE, yMargin / 2,
    VIRTUAL_WIDTH - xMargin / 2 - MAP_TALE_SIZE, VIRTUAL_HEIGHT - yMargin / 2) -- x1=140, y1=100, x2=140, y2=220 (по х - линии отступили вправо на 40 пикселей)
  
  -- первая горизонтальная линия
  
  love.graphics.line(xMargin / 2, yMargin / 2 + MAP_TALE_SIZE,
    VIRTUAL_WIDTH - xMargin / 2, yMargin / 2 + MAP_TALE_SIZE) -- х1=60,у1=140,х2=180,у2=140
  
  -- вторая горизонтальная линия
  local secondHorizontalLine = {60, 180, 180, 180} -- хватит пересчитывать переменные.
  love.graphics.line(secondHorizontalLine)
  
  -- рисует спрайты
  for  y = 1, MAP_HEIGHT do
    for x = 1, MAP_WIDTH do
      if map[y][x] == "" then
        -- ничего не делаем
      elseif map[y][x] == "X" then
        -- тогда рисуем Х - спрайт
        love.graphics.draw(xSprite)
      else
        end
    end
  end
end


function love.draw()
  push:start()
  drawMap()
  push:finish()
end