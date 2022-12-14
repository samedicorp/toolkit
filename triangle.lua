-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 27/08/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local Triangle = toolkit.define('Triangle')

function Triangle:init(p1, p2, p3)
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    return self
end

function Triangle:draw(layer, stroke, fill, width)
    stroke:setNextStroke(layer)
    fill:setNextFill(layer)
    setNextStrokeWidth(layer, width or 1)
    addTriangle(layer, self.p1.x, self.p1.y, self.p2.x, self.p2.y, self.p3.x, self.p3.y)
end