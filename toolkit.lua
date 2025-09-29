-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
--  Created by Samedi on 04/09/2022.
--  All code (c) 2022, The Samedi Corporation.
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

-- The modula screen module sets the source code of a screen at runtime. 
-- If the screen uses Toolkit, then its code needs access to it somehow.
--
-- If modula's `useLocal` property is set to true, the screen code will
-- include the line `require('samedicorp.toolkit.toolkit'), which will include
-- this file.
--
-- When `useLocal` is set to false, we instead use a pre-packed version of the
-- toolkit source code, which will be available from the main controller script
-- as a global function TOOLKIT_SOURCE()

toolkit = {}

require('samedicorp.toolkit.globals')

require('samedicorp.toolkit.align')
require('samedicorp.toolkit.color')
require('samedicorp.toolkit.font')
require('samedicorp.toolkit.point')
require('samedicorp.toolkit.rect')
require('samedicorp.toolkit.screen')
require('samedicorp.toolkit.text')
require('samedicorp.toolkit.triangle')
require('samedicorp.toolkit.widget')

require('samedicorp.toolkit.widgets.bar')
require('samedicorp.toolkit.widgets.button')
require('samedicorp.toolkit.widgets.chart')
require('samedicorp.toolkit.widgets.field')
require('samedicorp.toolkit.widgets.label')
require('samedicorp.toolkit.widgets.layer')
require('samedicorp.toolkit.widgets.scrollbar')
