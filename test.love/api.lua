function getResolution()
    return 1024,768
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
    love.graphics.rectangle("fill", x, y, width, height, radius, radius)
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
    return love.mouse.isDown()
end

function addText(layer, font, text, x, y)
    love.graphics.setFont(font)
    love.graphics.print(text, x, y)
end

function getTextBounds(font, text)
    local t = love.graphics.newText(font, text)
    local width, height = t:getDimensions()
    t:release()
    return width, height
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