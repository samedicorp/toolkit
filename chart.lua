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

    local labelSize = rect.height / (5 * count)
    local labelFont = toolkit.Font.new(fontName, labelSize)
    local barHeight = (rect.height / (count)) - labelFont.size

    local nameAlign = { h = toolkit.alignLeft, v = toolkit.alignTop }
    local percentAlign = { h = toolkit.alignRight, v = toolkit.alignTop }
    
    for name,bar in pairs(bars) do
        local percent = math.floor(bar.value * 100)
        rect.height = barHeight
        self:addWidget(toolkit.Bar.new(rect, bar.value))
        rect.y = rect.y + barHeight
        
        rect.height = labelSize
        self:addLabel(rect, toolkit.Text.new(name, labelFont, { align = nameAlign }))
        self:addLabel(rect, toolkit.Text.new(string.format("%d%%", percent), labelFont, { align = percentAlign }))
        rect.y = rect.y + labelFont.size
    end

    return self
end

function toolkit.Widget:addChart(...)
    local chart = Chart.new(...)
    self:addWidget(chart)
    return chart
end