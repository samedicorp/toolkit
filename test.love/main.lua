
require('api')

toolkit = {}
require('samedicorp.toolkit.toolkit')
require('screen_test')

function love.load()
end

function love.draw()
    love.graphics.setBlendMode("alpha")

    screen_test()
    local x = love.mouse.getX()
    local y = love.mouse.getY()
    local down
    if love.mouse.isDown() then
        down = "down"
    else
        down = ""
    end

    love.graphics.print(string.format("%s, %s %s", x, y, down), 10, 1000)
end

function love.update()
end

function love.keypressed(key, u)
    --Debug
    if key == "d" then --set to whatever key you want to use
       debug.debug()
    end
 end