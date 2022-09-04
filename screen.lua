-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 27/08/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local Screen = toolkit.define('Screen')

function Screen:rect()
    local width, height = getResolution()
    return toolkit.Rect.new(0, 0, width, height)
end

function Screen:safeRect()
    return self:rect():inset(8)
end

function Screen:cursor()
    local x,y = getCursor()
    return toolkit.Point.new(x, y)
end

function Screen:isCursorDown()
    return getCursorDown()
end

function Screen:isFocussed()
    return self:rect():contains(self:cursor())
end

function Screen:addLayer(rect)
    local layer = toolkit.Layer.new(rect, self)
    return layer
end

function Screen:scheduleRefresh()
    local rate
    if self:isFocussed() then
        rate = 2
    else
        rate = 30
    end

    requestAnimationFrame(rate)
    return rate
end