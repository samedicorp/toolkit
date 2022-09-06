
require('api')

toolkit = {}
require('samedicorp.toolkit.toolkit')
require('screen_test')

function love.load()
end

function love.draw()
    screen_test()
end

function love.update()
end

function love.keypressed(key, u)
    --Debug
    if key == "d" then --set to whatever key you want to use
       debug.debug()
    end
 end