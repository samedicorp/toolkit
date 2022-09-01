
require('api')

local Screen = require('samedicorp.toolkit.screen')

function love.conf(t)
    t.window.width = 1024
    t.window.height = 768
    t.window.title = "Toolkit Tester"
end

function love.load()
end

function love.draw()
    local screen = Screen.new()
    local layer = Screen:addLayer()
    layer:addLabel({100, 100}, "Hello World")
    layer:addButton({100, 150}, "Button")
    layer:render()
end

function love.update()
end

function love.keypressed(key, u)
    --Debug
    if key == "d" then --set to whatever key you want to use
       debug.debug()
    end
 end