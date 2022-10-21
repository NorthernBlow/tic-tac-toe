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

--маленькие квадраты
mAP_HEIGHT, mAP_WIDTH = 3, 3
mAP_TALE_SIZE = 40
mAP_WIDTH_SIZE = 40

SPRITE_PADDING = 6

-- подгружаем изображения

local xSprite = love.graphics.newImage('graphics/crest.png')
local oSprite = love.graphics.newImage('graphics/zero.png')

-- структуры данных

local map = {
  {"y","X",""},
  {"","","Y"},
  {"","x",""}
  }
  
local currentPlayer = 1
local SelectedX, SelectedY = 1, 1

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


function love.keypressed(key, scancode, isrepeat)
   if key == 'escape' then
    love.event.quit()
    end
  if key == "f11" then
		fullscreen = not fullscreen
		love.window.setFullscreen(fullscreen, "desktop")
	end
  if key == 'left' then
    if SelectedX > 1 then
      SelectedX = SelectedX - 1
  end
elseif key == 'right' then
  if SelectedX < 3 then
    SelectedX = SelectedX + 1
  end
elseif key == 'up' then
  if SelectedY > 1 then
    SelectedY = SelectedY - 1
  end
elseif  key == 'down' then
  if SelectedY < 3 then
    SelectedY = SelectedY + 1
    end
  end
end

function love.update(dt)
  
  
end


function drawMap()
  -- создаем карту 3 х 3
  local xMargin = VIRTUAL_WIDTH - (mAP_TALE_SIZE * 3)
  local yMargin = VIRTUAL_HEIGHT - (mAP_WIDTH_SIZE * 3) 
  
  
  -- устанавливаем стиль линий
  love.graphics.setLineStyle('smooth')
  
  -- устанавливаем цвет линий
  --love.graphics.setColor(0, 1, 2)
  
  --устанавливаем ширину линий в 2 пикселя
  love.graphics.setLineWidth(2)
  
  -- первая вертикальная линия
  love.graphics.line(xMargin / 2 + mAP_WIDTH_SIZE, yMargin / 2,
    xMargin / 2 + mAP_TALE_SIZE, VIRTUAL_HEIGHT - yMargin / 2) -- x1=100, y1=100, x2=140, y2=220
  
  -- вторая вертикальная линия
  love.graphics.line(VIRTUAL_WIDTH - xMargin / 2 - mAP_TALE_SIZE, yMargin / 2,
    VIRTUAL_WIDTH - xMargin / 2 - mAP_WIDTH_SIZE, VIRTUAL_HEIGHT - yMargin / 2) -- x1=140, y1=100, x2=140, y2=220 (по х - линии отступили вправо на 40 пикселей относительно первой линии
  
  -- первая горизонтальная линия
  love.graphics.line(xMargin / 2, yMargin / 2 + mAP_TALE_SIZE,
    VIRTUAL_WIDTH - xMargin / 2, yMargin / 2 + mAP_TALE_SIZE) -- х1=60,у1=140,х2=180,у2=140
  
  -- вторая горизонтальная линия
  local secondHorizontalLine = {60, 180, 180, 180} -- хватит пересчитывать переменные.
  love.graphics.line(secondHorizontalLine)
  
  -- рисует спрайты
  for  y = 1, mAP_HEIGHT do
    for x = 1, mAP_WIDTH do
      local xOffset = xMargin / 2 + mAP_TALE_SIZE * (x - 1)
      local yOffset = yMargin / 2 + mAP_WIDTH_SIZE * (y - 1)
      if map[y][x] == "" then
        -- ничего не делаем
      elseif map[y][x] == "X" then
        -- тогда рисуем Х - спрайт
        love.graphics.draw(xSprite, xOffset + SPRITE_PADDING, yOffset)
      else
        love.graphics.draw(oSprite, xOffset + SPRITE_PADDING, yOffset)
      end
      if x == SelectedX and y == SelectedY then
      love.graphics.setColor(2, 1, 0, 0.5)
      love.graphics.rectangle('fill', xOffset, yOffset, mAP_TALE_SIZE, mAP_WIDTH_SIZE)
      love.graphics.setColor(1, 1, 1, 1)
      end
    end
  end
end

function drawFiveToFiveMap()
  -- карта 5 на 5
  local MAP_TALE_SIZE = 80
  local VIRTUAL_WIDTH = 240
  local VIRTUAL_HEIGHT = 320
  
  local xMargin = VIRTUAL_WIDTH - (MAP_TALE_SIZE * 3) -- 240 - 120 = 120
  local yMargin = VIRTUAL_HEIGHT - (MAP_TALE_SIZE * 3) -- 320 - 120 = 200
  
end



function love.draw()
  push:start()
  love.graphics.print(tostring(love.graphics.getRendererInfo('name', 'device')), 100, 1)
  love.graphics.print(tostring(1.0 / love.timer.getDelta()), 200, 1)
  drawMap()
  love.graphics.setColor(0, 1, 2);
  love.graphics.print("Player " .. currentPlayer .. "'s turn")
  push:finish()
end