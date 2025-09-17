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
        align = options.align or { h = toolkit.alignLeft, v = toolkit.alignBaseline },
        options = options
    }

    setmetatable(t, { __index = Text })
    return t
end

function Text.asText(text, font, options)
    if type(text) == "string" then
        text = Text.new(text, font, options)
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
    local font = (self.font or layer.defaultFont).font
    local fill = explicitOptions.fill or self.options.fill

    local align = explicitOptions.align or self.align
    local position = rect:topLeft()
    if align.h == toolkit.alignRight then
        position.x = rect:topRight().x
    elseif align.h == toolkit.alignCenter then
        position.x = rect:topMid().x
    end
    if (align.v == toolkit.alignBottom) or (align.v == toolkit.alignDescender) then
        position.y = rect:bottomLeft().y
    elseif (align.v == toolkit.alignMiddle) or (align.v == toolkit.alignBaseline) then
        position.y = rect:midLeft().y
    end

    if fill then
        fill:setNextFill(layer.layer)
    end
    setNextTextAlign(layer.layer, align.h, align.v)
    addText(layer.layer, font, self.text, position.x, position.y)
end
