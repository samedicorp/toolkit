-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 27/08/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local Class = require('samedicorp.toolkit.class')
local Font = Class.define('font')

local loadFont = _ENV.loadFont

function Font:init(name, size)
    self.name = name
    self.size = size
    self.font = loadFont(name, size)
    return self
end

return Font