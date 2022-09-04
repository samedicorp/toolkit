-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 27/08/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


local Rect = toolkit.define("Rect")

function Rect:init(x, y, w, h)
    self.x = x
    self.y = y
    self.width = w or 0
    self.height = h or 0
    return self
end

--- Clone the input as a rect.
--- accepts another rect, or a 4-element table with x,y,width,height
function Rect.asRect(r)
    if not r.className then
        r = Rect.new(r[1], r[2], r[3], r[4])
    else
        r = Rect.new(r.x, r.y, r.width, r.height)
    end
    return r
end

function Rect:inset(l,t,r,b)
    t = t or l
    r = r or l
    b = b or t
    return self.new(self.x + l, self.y + t, self.width - (l + r), self.height - (t + b))
end

function right()
    return self.x + self.width - 1
end

function bottom()
    return self.y + self.height - 1
end

function Rect:topLeft()
    return toolkit.Point.new(self.x, self.y)
end

function Rect:midLeft()
    return self:topLeft():mid(self:bottomLeft())
end

function Rect:bottomLeft()
    return toolkit.Point.new(self.x, self.y + self.height - 1)
end

function Rect:topRight()
    return toolkit.Point.new(self.x + self.width - 1, self.y)
end

function Rect:midRight()
    return self:topRight():mid(self:bottomRight())
end

function Rect:bottomRight()
    return toolkit.Point.new(self.x + self.width - 1, self.y + self.height - 1)
end

function Rect:topMid()
    return self:topLeft():mid(self:topRight())
end

function Rect:bottomMid()
    return self:bottomLeft():mid(self:bottomRight())
end

function Rect:contains(point)
    return (point.x >= self.x) and (point.y >= self.y) and (point.x < (self.x + self.width)) and (point.y < (self.y + self.height))
end

function Rect:draw(layer, stroke, fill, options)
    options = options or {}
    stroke:setNextStroke(layer)
    fill:setNextFill(layer)
    setNextStrokeWidth(layer, options.width or 1)
    if options.radius then
        addBoxRounded(layer, self.x, self.y, self.width, self.height, options.radius)
    else
        addBox(layer, self.x, self.y, self.width, self.height)
    end
end