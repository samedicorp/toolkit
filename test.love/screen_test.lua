function screen_test()
    if payload and payload.command then
        lastCommand = payload
        reply = "done"
    end
    
    local bufferField
    
    fieldState = fieldState or {}
    local screen = toolkit.Screen.new()
    local layer = screen:addLayer()
    
    layer:addButton({50, 100, 60, 20}, "test", function()
        bufferField:append("test pressed", true)
    end)
    
    layer:addButton({50, 130, 60, 20}, "other", { 
        style = "line", 
        onMouseUp = function()
            bufferField:append("other pressed", true)
        end
    })
    
    layer:addButton({50, 200, 20, 20}, "up", { 
        style = "leftArrow", 
        onMouseUp = function()
            bufferField:append("left pressed", true)
        end
    })
    
    layer:addButton({80, 200, 20, 20}, "up", { 
        style = "upArrow", 
        onMouseUp = function()
            bufferField:append("up pressed", true)
        end
    })
    
    layer:addButton({110, 200, 20, 20}, "up", { 
        style = "downArrow", 
        onMouseUp = function()
            bufferField:append("down pressed", true)
        end
    })
    
    layer:addButton({140, 200, 20, 20}, "down", { 
        style = "rightArrow", 
        onMouseUp = function()
            bufferField:append("right pressed", true)
        end
    })
    
    startRect = startRect or {50, 300, 60, 20}
    layer:addButton(startRect, "dragme", {
        onMouseDrag = function(pos, button)
            if not buttonOffset then
                buttonOffset = button.rect:topLeft():minus(pos)
                startRect = button.rect
            else
                local newPos = pos:plus(buttonOffset)
                startRect.x = newPos.x
                startRect.y = newPos.y
            end
        end
    })
    
    layer:addLabel({10, 20}, string.format("screen: %s", name))
    if lastCommand then
        layer:addLabel({10, 40}, string.format("command: %s", lastCommand.command))
        layer:addLabel({10, 60}, string.format("argument: %s", lastCommand.argument))
        if rate then
            layer:addLabel({10, 80}, string.format("refresh: %s", rate))
        end
    end
    
    bufferField = layer:addField({200, 100, 200, 200}, fieldState)
    
    scrollState = scrollState or {}
    scrollbar = layer:addScrollbar({ 400, 100, 20, 200}, scrollState, {
        onScroll = function(s)
            print("scrolled to " .. s)
        end
    })

    local values = {
        { name = "item 1", value = 0.5 },
        { name = "item 2", value = 0.2 },
        { name = "item 3", value = 0.8 }
    }
    layer:addChart({ 500, 100, 200, 200 }, values, "Play")

    layer:render()
    screen:scheduleRefresh()
end