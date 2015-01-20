global.moment = require "moment"
global._      = require "lodash"
global.jQuery = require "jquery"
global.$      = global.jQuery
global.debug  = require "debug"
global.hljs   = require "highlight.js"


# Core of the site
require './entry.ls'
require './calendar.ls'

# Inlined css assets 
require('../css/obsidian.css')
require('../css/fonts.css')
require('../less/main.less')

global.$(document).ready ->
    hljs.initHighlighting!
