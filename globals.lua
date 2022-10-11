-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 04/09/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

function printf(format, ...)
    logMessage(string.format(tostring(format), ...))
end

debugf = printf

function sortedPairs (t, f)
  local a = {}
  for n in pairs(t) do table.insert(a, n) end
  table.sort(a, f)
  local i = 0      -- iterator variable
  local iter = function ()   -- iterator function
    i = i + 1
    if a[i] == nil then return nil
    else return a[i], t[ a[i] ]
    end
  end
  return iter
end

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

