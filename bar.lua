-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 27/08/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local Class = require('samedicorp.toolkit.class')
local Color = require('samedicorp.toolkit.color')
local Rect = require('samedicorp.toolkit.rect')
local Widget = require('samedicorp.toolkit.widget')

local Bar = Class.define('bar', Widget)

function Bar:init(rect, value)
    self.super.init(self, rect)
    self.value = value
    return self
end

function Bar:drawInLayer(layer)
    local inset = self.rect.width * (1.0 - self.value)
    self.rect:draw(layer.layer, Color.white, Color.black)
    local r = self.rect:inset(0, 0, inset, 0)
    r:draw(layer.layer, Color.white, Color.white)
end

function Widget:addBar(...)
    local bar = Bar.new(...)
    self:addWidget(bar)
    return bar
end

return Bar