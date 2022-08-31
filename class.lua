-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 30/08/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local Class = {}
local Object = { className = "object" }


function Object:init(...)
  return self
end

function Class.define(name, base)
  base = base or Object
  
  local definition = {}
  setmetatable(definition, { __index = base })
  definition.super = base
  definition.className = name

  function definition.new(...)
    local instance = {}
    setmetatable(instance, { __index = definition })
    instance = instance:init(...)
    return instance
  end

  return definition
end

return Class