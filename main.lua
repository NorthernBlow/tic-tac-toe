--[[
Крестики-нолики

Автор: Святослав Рэинхарт
evolution.is.not.theory@gmail.com

]]


local push = require "push"


-- JUST BECAUSE I LUVE AETHETIC
VIRTUAL_WIDTH = 240
VIRTUAL_HEIGHT = 320

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

local xSprite = love.graphics.newImage('graphics/crest.png')
local oSprite = love.graphics.newImage('graphics/zero.png')

function love.load()
  -- добавил немного размытия для более красивого отображения пикселей
  love.graphics.setDefaultFilter('nearest', 'nearest')
  push:setupScreen(VIRTUAL_HEIGHT, VIRTUAL_WIDTH, WINDOW_WIDTH, WINDOW_HEIGHT, {
      fullscreen = false,
      vsync = true,
      resizeble = true
      })
end



function love.keypressed(key)
  
  if key == 'escape' then
    love.event.quit()
    end

end


function love.update(dt)
  
  
end


function love.draw()
  push:start()
  love.graphics.print('New game')
  push:finish()
  end