-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 27/08/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local Text = toolkit.define('Text')

function Text.new(text, font, options)
    options = options or {}
    local t = { 
        text = text, 
        font = font, 
        align = options.align or { h = toolkit.Align.left, v = toolkit.Align.baseline },
        options = options
    }

    setmetatable(t, { __index = Text })
    return t
end

function Text.asText(text)
    if type(text) == "string" then
        text = Text.new(text)
    end
    return text
end

function Text:sizeInLayer(layer)
    local font = (self.font or layer.defaultFont).font
    return getTextBounds(font, self.text)
end

function Text:drawInLayer(layer, rect, explicitOptions)
    explicitOptions = explicitOptions or {}

    local position = rect:bottomMid()
    local options = explicitOptions or {}
    local font = (self.font or layer.defaultFont).font
    local fill = options.fill or self.options.fill
    if fill then
        fill:setNextFill(layer.layer)
    end

    local align = explicitOptions.align or self.align
    local position = rect:topLeft()
    if align.h == toolkit.Align.right then
        position.x = rect:topRight().x
    elseif align.h == toolkit.Align.center then
        position.x = rect:topMid().x
    end
    if (align.v == toolkit.Align.bottom) or (align.v == toolkit.Align.descender) then
        position.y = rect:bottomLeft().y
    elseif (align.v == toolkit.Align.middle) or (align.v == toolkit.Align.baseline) then
        position.y = rect:midLeft().y
    end

    setNextTextAlign(layer.layer, align.h, align.v)
    addText(layer.layer, font, self.text, position.x, position.y)
end

return Text
