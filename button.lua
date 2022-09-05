-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 28/08/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local Button = toolkit.define('Button', 'Widget')

function Button:init(rect, text, options)
    self.super.init(self, rect)
    if type(options) == "function" then
        options = { onMouseUp = options }
    else
        options = options or {}
    end

    local style = options.style
    if type(style) == "string" then
        style = Button["style_" .. style]
    end
    if not style then 
        style = Button.style_default
    end

    self.text = toolkit.Text.asText(text)
    self.onMouseDown = options.onMouseDown
    self.onMouseDrag = options.onMouseDrag
    self.onMouseUp = options.onMouseUp
    self.align = { h = toolkit.alignCenter, v = toolkit.alignMiddle }
    self.drawInLayer = style
    self.labelInset = options.labelInset or 2
    self.fitText = options.fitText or true

    return self
end

function Button:autoSize(layer)
    if self.fitText then
        local padding = self.labelInset * 2
        local w,h = self.text:sizeInLayer(layer)
        self.rect.width = w + padding
        self.rect.height = h + padding
    end
end

function Button:style_line(layer, isOver, isDown)
    local stroke = toolkit.red
    local fill = toolkit.black
    local text = toolkit.white
    if isDown and isOver then
        text = toolkit.black
        fill = toolkit.white
    elseif not isOver then
        stroke = toolkit.white
    end

    self:autoSize(layer)
    self.rect:draw(layer.layer, stroke, fill, { radius = 8.0 })
    local lr = self.rect:inset(self.labelInset)
    self.text:drawInLayer(layer, lr, { fill = text, align = self.align })
end

function Button:arrowColors(isOver, isDown)
    local stroke = toolkit.white
    local fill = toolkit.black
    if isDown and isOver then
        fill = toolkit.white
    elseif isOver then
        fill = toolkit.Color.new(1, 1, 1, 0.2)
    end
    return stroke, fill
end

function Button:style_default(layer, isOver, isDown)
    local stroke = toolkit.white
    local fill = toolkit.black
    local text = toolkit.white
    if isDown and isOver then
        text = toolkit.black
        fill = toolkit.white
    elseif isOver then
        fill = toolkit.Color.new(1, 1, 1, 0.2)
    end

    self:autoSize(layer)
    self.rect:draw(layer.layer, stroke, fill)
    local lr = self.rect:inset(self.labelInset)
    self.text:drawInLayer(layer, lr, { fill = text, align = self.align })
end


function Button:style_upArrow(layer, isOver, isDown)
    local stroke, fill = self:arrowColors(isOver, isDown)
    local rect = self.rect
    local upT = toolkit.Triangle.new(rect:bottomLeft(), rect:bottomRight(), rect:topLeft():mid(rect:topRight()))
    upT:draw(layer.layer, stroke, fill)
end


function Button:style_downArrow(layer, isOver, isDown)
    local stroke, fill = self:arrowColors(isOver, isDown)
    local rect = self.rect
    local downT = toolkit.Triangle.new(rect:topLeft(), rect:topRight(), rect:bottomLeft():mid(rect:bottomRight()))
    downT:draw(layer.layer, stroke, fill)
end

function Button:style_leftArrow(layer, isOver, isDown)
    local stroke, fill = self:arrowColors(isOver, isDown)
    local rect = self.rect
    local downT = toolkit.Triangle.new(rect:topLeft():mid(rect:bottomLeft()), rect:topRight(), rect:bottomRight())
    downT:draw(layer.layer, stroke, fill)
end

function Button:style_rightArrow(layer, isOver, isDown)
    local stroke, fill = self:arrowColors(isOver, isDown)
    local rect = self.rect
    local downT = toolkit.Triangle.new(rect:topRight():mid(rect:bottomRight()), rect:topLeft(), rect:bottomLeft())
    downT:draw(layer.layer, stroke, fill)
end

function toolkit.Widget:addButton(...)
    local button = Button.new(...)
    self:addWidget(button)
    return button
end