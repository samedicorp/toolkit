-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 30/08/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local Align = require('samedicorp.toolkit.align')
local Bar = require('samedicorp.toolkit.bar')
local Font = require('samedicorp.toolkit.font')
local Label = require('samedicorp.toolkit.label')
local Rect = require('samedicorp.toolkit.rect')
local Text = require('samedicorp.toolkit.text')
local Widget = require('samedicorp.toolkit.widget')

Chart = { super = Widget }
setmetatable(Chart, { __index = Widget })

function Chart.new(rect, bars, fontName)
    local c = { 
        rect = Rect.asRect(rect), 
        widgets = {},
        font = font
    }

    setmetatable(c, { __index = Chart })
    Chart.super.init(c)

    local count = 0
    for _,_ in pairs(bars) do
        count = count + 1
    end

    local labelSize = rect.height / (5 * count)
    local labelFont = Font.new(fontName, labelSize)
    local barHeight = (rect.height / (count)) - labelFont.size

    local nameAlign = { h = Align.left, v = Align.top }
    local percentAlign = { h = Align.right, v = Align.top }
    
    for name,bar in pairs(bars) do
        local percent = math.floor(bar.value * 100)
        rect.height = barHeight
        c:addWidget(Bar.new(rect, bar.value))
        rect.y = rect.y + barHeight
        
        rect.height = labelSize
        c:addLabel(rect, Text.new(name, labelFont, { align = nameAlign }))
        c:addLabel(rect, Text.new(string.format("%d%%", percent), labelFont, { align = percentAlign }))
        rect.y = rect.y + labelFont.size
    end

    return c


end


return Chart