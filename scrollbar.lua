local Scrollbar = toolkit.define("Scrollbar", "Widget")

function Scrollbar:init(rect, state, options)
    self.super.init(self, rect)

    options = options or {}

    state = state or {}
    state.scroll = state.scroll or 0

    self.state = state
    self.onScroll = options.onScroll
    self.minimum = options.minimum or 0
    self.maximum = options.maximum or 0

    local frameRect = self.rect
    local frameBottom = frameRect:bottom()
    local buttonRect = frameRect:inset(2)
    buttonRect.height = buttonRect.width
    
    local capturedSelf = self
    self:addButton(buttonRect, "", { 
        style = "upArrow",
        onMouseDown = function()
            capturedSelf:scrollUp()
        end
    })

    buttonRect:setBottom(frameBottom)
    self:addButton(buttonRect, "", { 
        style = "downArrow", 
        onMouseDown = function()
            capturedSelf:scrollDown()
        end
    })

    return self
end

function Scrollbar:scrollUp()
    self:scrollTo(self.state.scroll + 1)
end

function Scrollbar:scrollDown()
    self:scrollTo(self.state.scroll - 1)
end

function Scrollbar:scrollTo(s)
    if s > self.maximum then
        s = self.maximum
    elseif s < self.minimum then
        s = self.minimum
    end

    if s ~= self.state.scroll then
        self.state.scroll = s
        if self.onScroll then
            self.onScroll(s)
        end
    end
end

function Scrollbar:drawInLayer(layer)
    self.rect:draw(layer.layer, toolkit.white, toolkit.black)
end

function toolkit.Widget:addScrollbar(...)
    local bar = Scrollbar.new(...)
    self:addWidget(bar)
    return bar
end