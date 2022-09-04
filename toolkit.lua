-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 04/09/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

function printf(format, ...)
    logMessage(string.format(tostring(format), ...))
end

debugf = printf

toolkit = {}

toolkit.Object = { className = "object" }

function toolkit.Object:init(...)
  return self
end

function toolkit.define(name, baseName)
    local base
    if baseName then
        base = toolkit[baseName]
        if not base then
            printf("forward declared %s", baseName)
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
  printf("declared %s", name)

  function definition.new(...)
    local instance = {}
    setmetatable(instance, { __index = definition })
    instance = instance:init(...)
    return instance
  end

  return definition
end

require('samedicorp.toolkit.align')
require('samedicorp.toolkit.bar')
require('samedicorp.toolkit.button')
require('samedicorp.toolkit.chart')
require('samedicorp.toolkit.color')
require('samedicorp.toolkit.font')
require('samedicorp.toolkit.label')
require('samedicorp.toolkit.layer')
require('samedicorp.toolkit.point')
require('samedicorp.toolkit.rect')
require('samedicorp.toolkit.screen')
require('samedicorp.toolkit.text')
require('samedicorp.toolkit.triangle')
require('samedicorp.toolkit.widget')
