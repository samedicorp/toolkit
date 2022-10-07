-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 27/08/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local Color = toolkit.define('Color')

function Color:init(r, g, b, a)
    self.red = r
    self.green = g
    self.blue = b
    self.alpha = a or 1
    return self
end

toolkit.white = Color.new(1, 1, 1)
toolkit.black = Color.new(0, 0, 0)
toolkit.red = Color.new(1, 0, 0)
toolkit.green = Color.new(0, 1, 0)
toolkit.blue = Color.new(0, 0, 1)
toolkit.grey = Color.new(0.5, 0.5, 0.5)

function Color:setNextStroke(layer)
    setNextStrokeColor(layer, self.red, self.green, self.blue, self.alpha)
end

function Color:setNextFill(layer)
    setNextFillColor(layer, self.red, self.green, self.blue, self.alpha)
end
