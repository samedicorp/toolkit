-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 04/09/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

function printf(format, ...)
    logMessage(string.format(tostring(format), ...))
end

debugf = printf


toolkit.Object = { className = "object" }

function toolkit.Object:init(...)
  return self
end

function toolkit.define(name, baseName)
    local base
    if baseName then
        base = toolkit[baseName]
        if not base then
            base = {}
            toolkit[baseName] = base
        end
    else
        base = toolkit.Object
    end
  
  local definition = toolkit[name] or {}
  setmetatable(definition, { __index = base })
  definition.super = base
  definition.className = name
  toolkit[name] = definition

  function definition.new(...)
    local instance = {}
    setmetatable(instance, { __index = definition })
    instance = instance:init(...)
    return instance
  end

  return definition
end

