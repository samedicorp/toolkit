-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 05/09/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local Field = toolkit.define('Field', 'Widget')

function Field:init(rect, state, options)
    state = state or {}
    state.lines = state.lines or {}
    state.scroll = state.scroll or 0
    state.scrollToEnd = state.scrollToEnd or false
    options = options or {}

    self.super.init(self, rect)
    self.state = state
    self.font = options.font
    return self
end

function Field:hitTest(cursor)
    return false
end

function Field:drawInLayer(layer)
    local font = self.font or layer.defaultFont
    local x = self.rect.x
    local y = self.rect.y
    local width = self.rect.width
    local height = self.rect.height
    local maxY = y + height
    local state = self.state
    local lines = state.lines
    local scroll = state.scroll
    local lineCount = math.floor(height / font.size)
    if state.scrollToEnd then
        scroll = #lines - lineCount
        state.scroll = scroll
    end

    for i,line in ipairs(lines) do
        if i >= scroll then
            y = y + font.size
            addText(layer.layer, font.font, line, x, y)
            if y > maxY then
                break
            end
        end
        i = i + 1
    end 
end

function Field:append(text, scrollToEnd)
    table.insert(self.state.lines, text)
    self.state.scrollToEnd = scrollToEnd
end

function toolkit.Widget:addField(...)
    local field = Field.new(...)
    self:addWidget(field)
    return field
end