-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 27/08/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

function printf(format, ...)
    logMessage(string.format(tostring(format), ...))
end

debugf = printf

local Class = require('samedicorp.toolkit.class')

local Bar = require('samedicorp.toolkit.bar')
local Button = require('samedicorp.toolkit.button')
local Chart = require('samedicorp.toolkit.chart')
local Color = require('samedicorp.toolkit.color')
local Font = require('samedicorp.toolkit.font')
local Label = require('samedicorp.toolkit.label')
local Layer = require('samedicorp.toolkit.layer')
local Point = require('samedicorp.toolkit.point')
local Rect = require('samedicorp.toolkit.rect')
local Triangle = require('samedicorp.toolkit.triangle')
local Widget = require('samedicorp.toolkit.widget')

local Screen = Class.define('screen')

-- local getResolution = _ENV.getResolution
-- local getCursor = _ENV.getCursor
-- local getCursorDown = _ENV.getCursorDown

function Screen:rect()
    local width, height = getResolution()
    return Rect.new(0, 0, width, height)
end

function Screen:safeRect()
    return self:rect():inset(8)
end

function Screen:cursor()
    local x,y = getCursor()
    return Point.new(x, y)
end

function Screen:isCursorDown()
    return getCursorDown()
end

function Screen:isFocussed()
    return self:rect():contains(self:cursor())
end

function Screen:addLayer(rect)
    local layer = Layer.new(rect, self)
    return layer
end

return Screen