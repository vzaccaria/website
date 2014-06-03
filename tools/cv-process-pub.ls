#!/usr/bin/env lsc
# options are accessed as argv.option

_       = require('underscore')
_.str   = require('underscore.string');
moment  = require 'moment'
fs      = require 'fs'
color   = require('ansi-color').set
os      = require('os')
shelljs = require('shelljs')
table   = require('ansi-color-table')

_.mixin(_.str.exports());
_.str.include('Underscore.string', 'string');

name        = "process-publications"
description = "generates json/md from bibliography file"
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


usage-string = """

#{color(name, \bold)}. #{description}
(c) #author, #year

Usage: #{name} [--option=V | -o V] 
"""

require! 'optimist'

argv     = optimist.usage(usage-string,
              bibtex:
                alias: 'f', description: 'bibtex file', default: "#src/../data/biblio.bib"

              markdown: 
                alias: 'm', description: 'generates a markdown file', boolean: false

              stand-alone: 
                alias: 's', description: 'generates the header', boolean: false

              published: 
                alias: 'p', description: 'generates only published apps', boolean: false

              help:
                alias: 'h', description: 'this help'

                         ).boolean(\h).argv


if(argv.help)
  optimist.showHelp()
  return

command = argv._

var filter

shelljs.exec "lsc -c #src/cv-generate-json.ls", ->

  if not argv.markdown
    filter := "underscore print"
  else 
    filter := "node #src/cv-generate-json.js"
    if not argv.stand-alone? or not argv.stand-alone
      filter := filter + " -n"

    if argv.published
      filter := filter + " -p"


  cmd = "cat #{argv.bibtex} | #src/bibjson.py | #filter" 
  # console.error cmd
  shelljs.exec cmd, ->




