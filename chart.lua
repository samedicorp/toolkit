-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 30/08/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

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

    local x = rect.x
    local y = rect.y
    local labelSize = rect.height / (5 * count)
    local labelFont = Font.new(fontName, labelSize)
    local barHeight = (rect.height / (count)) - labelFont.size
    local barWidth = rect.width

    for name,bar in pairs(bars) do
        local percent = math.floor(bar.value * 100)
        c:addWidget(Bar.new({0, y, barWidth, barHeight}, bar.value))
        y = y + barHeight + labelFont.size
        c:addWidget(Label.new({ 0, y - 4}, Text.new(name, labelFont)))
        c:addWidget(Label.new({ rect.width - (barWidth / 2), y }, Text.new(string.format("%d%%", percent), labelFont)))
    end

    return c


end


return Chart