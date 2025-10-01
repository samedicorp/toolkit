-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 27/08/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local Layer = toolkit.define('Layer', 'Widget')

function Layer:init(rect, screen)
    self.super.init(self, rect or screen:safeRect())
    self.layer = createLayer()
    self.defaultFont = toolkit.Font.new("Play", 20)
    self.screen = screen

    return self
end

function Layer:draw(object)
    object:drawInLayer(self)
end

function Layer:render()
    local r = self.rect
    setLayerClipRect(self.layer, 0, 0, r.width, r.height)
    setLayerTranslation(self.layer, r.x, r.y)

    local cursor = self.screen:cursor()
    local isDown = self.screen:isCursorDown()

    local over = self:renderAll(self, cursor, isDown)
    self.over = over

    if isDown and over and not toolkit.clickedWidget then
        toolkit.clickedWidget = over
        toolkit.clickedWidget:mouseDown(cursor)
    elseif not isDown and toolkit.clickedWidget then
        toolkit.clickedWidget:mouseUp(cursor)
        toolkit.clickedWidget = nil
    elseif isDown and toolkit.clickedWidget then
        toolkit.clickedWidget:mouseDrag(cursor)
    end
end

function Layer:textField(text, rect, font)
    local lines = text:gmatch("[^\n]+")
    self:textLineField(lines, rect, font)
end

function Layer:textLineField(lines, rect, font)
    local layer = self.layer
    local font = font or self.defaultFont
    local i = 0
    local x = rect.x
    local y = rect.y
    local width = rect.width
    local height = rect.height

    local scrollBarWidth = 24
    local scrollX = x + width - scrollBarWidth

    local bar = toolkit.Rect.new(x + width - scrollBarWidth + 1, y, scrollBarWidth, height - 1)
    local barIn = bar:inset(4)

    local upFill = toolkit.black
    local downFill = toolkit.black

    local s = scroll or 0
    local cursor = self.screen:cursor()
    if self.screen:isCursorDown() and (cursor.x > scrollX) then
        if cursor.y > (height / 2) then
            scroll = s + 1
            downFill = toolkit.white
        elseif s > 0 then
            scroll = s - 1
            upFill = toolkit.white
        end
    end

    for i, w in ipairs(lines) do
        if i >= s then
            y = y + font.size
            addText(layer, font.font, w, x, y)
            if y > height then
                break
            end
        end
        i = i + 1
    end

    -- local text = string.format('render cost: %.02f', getRenderCost() / getRenderCostMax())
    -- addText(layer, font, text, 10, 20)

    bar:draw(layer, toolkit.white, toolkit.black)
    local barInH = barIn.height
    barIn.height = barIn.width
    local upT = toolkit.Triangle.new(barIn:bottomLeft(), barIn:bottomRight(), barIn:topLeft():mid(barIn:topRight()))
    upT:draw(layer, toolkit.white, upFill)
    barIn.y = barIn.y + barInH - barIn.width
    local downT = toolkit.Triangle.new(barIn:topLeft(), barIn:topRight(), barIn:bottomLeft():mid(barIn:bottomRight()))
    downT:draw(layer, toolkit.white, downFill)
end
