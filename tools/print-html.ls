#!/usr/bin/env lsc
# options are accessed as argv.option

_      = require('underscore')
_.str  = require('underscore.string');
moment = require 'moment'
fs     = require 'fs'
color  = require('ansi-color').set
os      = require('os')
shelljs = require('shelljs')
table = require('ansi-color-table')

_.mixin(_.str.exports());
_.str.include('Underscore.string', 'string');

name        = "printit"
description = "Print html to pdf"
author      = "Vittorio Zaccaria"
year        = "2013"

src = __dirname
otm = if (os.tmpdir?) then os.tmpdir() else "/var/tmp"
cwd = process.cwd()

setup-temporary-directory = ->
    name = "tmp_#{moment().format('HHmmss')}_tmp"
    dire = "#{otm}/#{name}" 
    shelljs.mkdir '-p', dire
    return dire

remove-temporary-directory = (dir) ->
    shelljs.rm '-rf', dir 
    
usage-string = """

#{color(name, \bold)}. #{description}
(c) #author, #year

Usage: #{name} [--option=V | -o V] 
"""

require! 'optimist'

argv     = optimist.usage(usage-string,

              output:
                alias: 'o', description: 'output file', default: 'out.pdf'

              help:
                alias: 'h', description: 'this help', default: false

              wait:
                alias: 'w', description: 'wait for ms before checking for pdf ready', default: 2000 
                         ).boolean(\h).argv


if(argv.help or argv._.length == 0)
  optimist.showHelp()
  return

command = argv._

osa-open = (f) ->
  "open -a Safari #f"

osa-exec = (c, cb) ->
  shelljs.exec "osascript -e '#c'", cb

osa-print = 'tell app "Safari" to print window 1 with properties {target printer: "PDFwriter"}'

osa-quit = 'tell app "Safari" to quit'

spool-dir = "/Users/Shared/PDFwriter/#{process.env.LOGNAME}"

osa-cleanup-dir = (cb) ->
  shelljs.rm("#spool-dir/*")
  cb()

console.log "Spool-dir: #spool-dir"
shelljs.exec osa-open(command[0]), (code, output) ->
    osa-cleanup-dir (code, output) ->
        osa-exec osa-print, (code, output) ->
              osa-exec osa-quit, (code, output) ->
                  set-timeout (-> shelljs.cp('-f', "#spool-dir/job*.pdf", argv.output)), argv.wait




