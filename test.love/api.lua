function getResolution()
    local x, y, w, h = love.window.getSafeArea()
    local rx = love.window.toPixels(w)
    local ry = love.window.toPixels(h)
    return rx, ry
end

function setNextFillColor(layer, red, green, blue, alpha)
    fillColor = { red, green, blue, alpha }
end

function setNextStrokeColor(layer, red, green, blue, alpha)
    strokeColor = { red, green, blue, alpha }
end

function setNextStrokeWidth(layer, width)
end

function setNextTextAlign(layer, alignX, alignY)
    alignment = { h = alignX, v = alignY }
end

function addBox(layer, x, y, width, height)
    local red, green, blue, alpha = fillColor
    love.graphics.setColor(red, green, blue, alpha)
    love.graphics.rectangle("fill", x, y, width, height)

    red, green, blue, alpha = strokeColor
    love.graphics.setColor(red, green, blue, alpha)
    love.graphics.rectangle("line", x, y, width, height)
end

function addBoxRounded(layer, x, y, width, height, radius)
    local red, green, blue, alpha = fillColor
    love.graphics.setColor(red, green, blue, alpha)
    love.graphics.rectangle("fill", x, y, width, height, radius, radius)

    red, green, blue, alpha = strokeColor
    love.graphics.setColor(red, green, blue, alpha)
    love.graphics.rectangle("line", x, y, width, height, radius, radius)
end

function addTriangle(layer, x1, y1, x2, y2, x3, y3)
    local red, green, blue, alpha = fillColor
    love.graphics.setColor(red, green, blue, alpha)
    love.graphics.polygon("fill", x1, y1, x2, y2, x3, y3)

    red, green, blue, alpha = strokeColor
    love.graphics.setColor(red, green, blue, alpha)
    love.graphics.polygon("line", x1, y1, x2, y2, x3, y3)
end

function createLayer()
end

function loadFont(name, size)
    return love.graphics.newFont(size)
end

function setLayerClipRect()
end

function setLayerTranslation()
end

function getCursor()
    return love.mouse.getX(), love.mouse.getY()
end

function getCursorDown()
    return love.mouse.isDown(1)
end

function addText(layer, font, text, x, y)
    alignment = alignment or { h = AlignH_Left, v = AlignV_Top }

    local t = love.graphics.newText(font, text)
    local width, height = t:getDimensions()

    if alignment.h == AlignH_Center then
        x = x - (width / 2)
    elseif alignment.h == AlignH_Right then
        x = x - width
    end

    if alignment.v == AlignV_Middle then
        y = y + (height / 2)
    end

    love.graphics.setColor(fillColor)
    love.graphics.draw(t, x, y - height)
end

function getTextBounds(font, text)
    local t = love.graphics.newText(font, text)
    local width, height = t:getDimensions()
    t:release()
    return width, height
end

function requestAnimationFrame(frame)
end

function logMessage(...)
    print(...)
end

AlignH_Left = 1
AlignH_Center = 2
AlignH_Right = 3

AlignV_Top = 1
AlignV_Ascender = 2
AlignV_Middle = 3
AlignV_Baseline = 4
AlignV_Bottom = 5
AlignV_Descender = 6

_ENV = _G