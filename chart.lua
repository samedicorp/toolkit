-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 30/08/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local Chart = toolkit.define('Chart', 'Widget')

function Chart:init(rect, bars, fontName)
    self.super.init(self, rect)

    local count = 0
    for _,_ in pairs(bars) do
        count = count + 1
    end

    local textColor = toolkit.blue
    local percentColor = toolkit.blue

    local labelSize = rect.height / (2 * count)
    local spacerSize = rect.height / (5 * count)
    local labelFont = toolkit.Font.new(fontName, labelSize)
    local barHeight = (rect.height / (count)) - spacerSize

    local nameAlign = { h = toolkit.alignLeft, v = toolkit.alignMiddle }
    local percentAlign = { h = toolkit.alignRight, v = toolkit.alignMiddle }
    
    for name,bar in pairs(bars) do
        local percent = math.floor(bar.value * 100)
        rect.height = barHeight
        self:addWidget(toolkit.Bar.new(rect, bar.value))
        -- rect.y = rect.y + barHeight - labelFont.size
        local labelRect = rect:inset(spacerSize / 2)
        -- labelRect.height = labelSize

        self:addLabel(labelRect, toolkit.Text.new(name, labelFont, { align = nameAlign, fill = textColor }))
        self:addLabel(labelRect, toolkit.Text.new(string.format("%d%%", percent), labelFont, { align = percentAlign, fill = percentColor }))
        rect.y = rect.y + barHeight + spacerSize
    end

    return self
end

function toolkit.Widget:addChart(...)
    local chart = Chart.new(...)
    self:addWidget(chart)
    return chart
end