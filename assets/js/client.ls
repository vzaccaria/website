global.moment = require "moment"
global._      = require "lodash"
global.jQuery = require "jquery"
global.$      = global.jQuery
global.debug  = require "debug"
# Awesome dynamic CSS
# require "DynCSS"

# # Core of the site
require './entry.ls'
require './calendar.ls'
