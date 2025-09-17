-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 27/08/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local Label = toolkit.define('Label', 'Widget')

function Label:init(rect, text, options)
    self.super.init(self, rect)
    self.text = toolkit.Text.asText(text, nil, options)
    return self
end

function Label:hitTest(cursor)
    return false
end

function Label:drawInLayer(layer)
    self.text:drawInLayer(layer, self.rect)
end

function toolkit.Widget:addLabel(...)
    local label = Label.new(...)
    self:addWidget(label)
    return label
end
