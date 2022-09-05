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
        style = Button[style]
    end
    if not style then 
        style = Button.defaultStyle
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

function Button:lineStyle(layer, isOver, isDown)
    local stroke
    local fill
    local text
    if isDown and isOver then
        stroke = toolkit.red
        text = toolkit.black
        fill = toolkit.white
    elseif isOver then
        stroke = toolkit.red
        text = toolkit.white
        fill = toolkit.black
    else
        stroke = toolkit.white
        text = toolkit.white
        fill = toolkit.black
    end

    self:autoSize(layer)
    self.rect:draw(layer.layer, stroke, fill, { radius = 8.0 })
    local lr = self.rect:inset(self.labelInset)
    self.text:drawInLayer(layer, lr, { fill = text, align = self.align })
end

function Button:defaultStyle(layer, isOver, isDown)
    local stroke
    local fill
    local text
    if isDown and isOver then
        stroke = toolkit.white
        text = toolkit.black
        fill = toolkit.white
    elseif isOver then
        stroke = toolkit.white
        text = toolkit.white
        fill = toolkit.Color.new(1, 1, 1, 0.2)
    else
        stroke = toolkit.white
        text = toolkit.white
        fill = toolkit.black
    end

    self:autoSize(layer)
    self.rect:draw(layer.layer, stroke, fill)
    local lr = self.rect:inset(self.labelInset)
    self.text:drawInLayer(layer, lr, { fill = text, align = self.align })
end

function toolkit.Widget:addButton(...)
    local button = Button.new(...)
    self:addWidget(button)
    return button
end