
require('api')

local Screen = require('samedicorp.toolkit.screen')


function love.draw()
    local screen = Screen.new()
    local layer = Screen:addLayer()
    layer:addLabel({100, 100}, "Hello World")
    layer:addButton({100, 150}, "Button")
    layer:render()
end