local Scrollbar = toolkit.define("Scrollbar", "Widget")

function Scrollbar:init(rect, state, options)
    self.super.init(self, rect)

    local frameRect = self.rect
    local frameBotton = frameRect:bottom()
    local buttonRect = frameRect:inset(2)
    buttonRect.height = buttonRect.width
    
    self:addButton(buttonRect, "", { style = "upArrow" })

    buttonRect:setBottom(frameBotton)
    self:addButton(buttonRect, "", { style = "downArrow" })

    return self
end

function Scrollbar:drawInLayer(layer)
    print(#self.widgets)
    self.rect:draw(layer.layer, toolkit.white, toolkit.black)
end

function toolkit.Widget:addScrollbar(...)
    local bar = Scrollbar.new(...)
    self:addWidget(bar)
    return bar
end