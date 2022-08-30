-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 27/08/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local Class = require('samedicorp.toolkit.class')
local Point = require('samedicorp.toolkit.point')
local Rect = require('samedicorp.toolkit.rect')
local Text = require('samedicorp.toolkit.text')
local Widget = require('samedicorp.toolkit.widget')

local Label = Class.define('label', Widget)

function Label:init(rect, text)
    self.super.init(self, rect)
    self.text = Text.asText(text)
    return self
end

function Label:hitTest(cursor)
    return false
end

function Label:drawInLayer(layer)
    self.text:drawInLayer(layer, self.rect)
end

function Widget:addLabel(...)
    local label = Label.new(...)
    self:addWidget(label)
    return label
end

return Label