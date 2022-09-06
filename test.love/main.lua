
require('api')

toolkit = {}
require('samedicorp.toolkit.toolkit')

function love.load()
end

function love.draw()
    local screen = toolkit.Screen.new()
    local layer = screen:addLayer()
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