#!/usr/bin/env lsc

#### Filter transaction data

_        = require('underscore')
_.str    = require('underscore.string');
moment   = require 'moment'
fs       = require 'fs'
color    = require('ansi-color').set
optimist = require('optimist')


_.mixin(_.str.exports());
_.str.include('Underscore.string', 'string');

# Normalization patterns.

patt =
  "zaccaria"   : "Vittorio      Zaccaria"
  "palermo"    : "Gianluca      Palermo"
  "silvano"    : "Cristina      Silvano"
  "sami"       : "Mariagiovanna Sami"
  "sciuto"     : "Donatella     Sciuto"
  "fornaciari" : "William       Fornaciari"
  "piuri"      : "Vincenzo      Piuri"
  "zafalon"    : "Roberto       Zafalon"
  "bona"       : "Andrea        Bona"
  "prestileo"  : "Andrea        Prestileo"
  "benini"     : "Luca          Benini"
  "mariani"    : "Giovanni      Mariani"
  "salvemini"  : "Lorenzo       Salvemini"
  "bertels"    : "Koen          Bertels"
  "sima"       : "Vlad          Mihai Sima"
  "bertoni"    : "Guido         Bertoni"
  "bircan"     : "Aril          Bircan"
  "breveglieri": "Luca          Breveglieri"
  "fragneto"   : "Pasqualina    Fragneto"
  "macchetti"  : "Marco         Macchetti"
  "valsecchi"  : "Simone        Valsecchi"
  "monchier"   : "Matteo        Monchiero"
  "chinosi"    : "Mauro         Chinosi"
  "Bruni"      : "Davide        Bruni"
  "pagni"      : "Andrea        Pagni"
  "lucini"     : "Fabrizio      Lucini"
  "pau"        : "Danilo Pietro Pau"
  "borneo"     : "Antonio       Borneo"
  "soti"       : "Sotiris       Xydis"
  "aone"       : "Edoardo       Paone"
  "reghiz"     : "Stefano Crespi Reghizzi"
  "elpign"     : "Diego         Melpignano"
  "ossei"      : "Amir          Ashouri"
  "iacomo"     : "Giacomo Marchiri"
  "augou"      : "Germain Haugou"
  "epley"      : "Thierry Lepley"
  "ellasi"     : "Patrick Bellasi"
  "assari"     : "Giuseppe Massari"
  "adioli"     : "Davide Gadioli"
  "gosta"      : "Giovanni Agosta"
  "andale"     : "Michele Scandale"
  "ibutti"     : "Simone Libutti"

print = console.log

# Print padding.
pad = 25

months =
  "jan": "January"
  "feb": "February"
  "mar": "March"
  "apr": "April"
  "may": "May"
  "jun": "June"
  "jul": "July"
  "aug": "August"
  "sep": "September"
  "oct": "October"
  "nov": "November"
  "dec": "December"

fix_month = (r) ->
  if r.month?
    for short, long of months
      if(_.str.include(r.month.toLowerCase(), short))
        r.month = long

strip = (s) ->
  return _.words(s)[1]

fix_identifier = (r) ->
  if r.identifier?
    r.identifier.map (m) ->
        m.type = "issn" if _.str.include(m.id.toLowerCase(), "issn")
        m.type = "isbn" if _.str.include(m.id.toLowerCase(), "isbn")
        m.id   = strip(m.id) if _.str.include(m.id.toLowerCase(), "issn") or _.str.include(m.id.toLowerCase(), "isbn")

format_name = (n) ->
   cn = _.words(n)
   cn[0] = cn[0][0]+". "
   return _.clean(_.toSentence(cn, ' ', ' '))

fix_names = (r) ->
  r.author.forEach (a) ->

    cn = _.words(a.name, ",")

    if cn[1]?
      nn = _.clean(cn[1]+". "+cn[0])
    else
      nn = a.name

    a.name = nn

    for short, long of patt
      if _.str.include(a.name.toLowerCase(), short.toLowerCase())
        a.name = format_name long

    delete a.id

getauthors = (d) ->
  return _.toSentence(d.author.map (m) -> m.name);
  # names = d.author.map (m) -> m.name;
  return "#{names[0]} *et al.*"


getdate = (d) ->
  td = []
  if d.year?
    td = d.year
    if d.month?
      if d.day?
        td = d.month+" "+d.day+", "+td
      else
        td = d.month+" "+td
  return td

print_id = (r) ->
  if r.identifier?
    ids = r.identifier.map (i) ->
            if i.type == "isbn" then return "[isbn](http://www.worldcat.org/isbn/#{i.id})"
            if i.type == "issn" then return "[issn](http://www.worldcat.org/issn/#{i.id})"
            if i.type == "doi"  then return "[doi](http://dx.doi.org/#{i.id})"
    idd = " \\[ #{_.toSentence(ids, '|')} \\]"
  else
    idd = ""
  return idd;

print_conference = (r) ->

  pages    = if r.pages?    then ", pp. #{r.pages}" else ""
  location = if r.address?  then "#{r.address}" else ""
  idd = print_id r
 
  if not ('accepted' in r.keyword)
    print "1. #{getauthors r}, *#{r.title}*, **#{r.booktitle}**#{pages} - #{location} #{getdate r}. #{idd}"
  else 
    print "1. #{getauthors r}, *#{r.title}*, **#{r.booktitle}**, **Accepted for publication** (awaiting production)."

print_book = (r) ->

  pages    = if r.pages?    then ", #{r.pages} pages" else ""
  location = if r.address?  then "#{r.address}" else ""
  idd = print_id r

  print "1. #{getauthors r}, **#{r.title}**#{pages} - #{r.publisher}, #{location} #{getdate r}. #{idd}"

print_journal = (r) ->

  pages    = if r.pages?    then ", pp. #{r.pages}" else ""
  location = if r.address?  then "#{r.address}" else ""
  idd = print_id r

  if not ('accepted' in r.keyword)
    print "1. #{getauthors r}, *#{r.title}*, **#{r.journal.name}**#{pages} -  #{r.publisher}, #{location} - #{getdate r}. #{idd}"
  else 
    print "1. #{getauthors r}, *#{r.title}*, **#{r.journal.name}**, **Accepted for publication** (awaiting production). "

print_patent = (r) ->
  pt = if 'application' in r.keyword then "(A1 - application)" else "granted"
  pn = r.address + " "+_.numberFormat(_.toNumber(r.number), 0)
  print "1. #{getauthors r}, *#{r.title}* - #{r.year} - number: **#{pn}** - type: **#{pt}** - \\[ [url](#{r.link[0].url}) \\]"

argv     = optimist.usage('Generate markdown from json csv files.\nUsage: $0 --option=V | -o V',
              nohead:
                alias: 'n', description: 'dont print header'
              published:
                alias: 'p', description: 'only published papers', default: false).argv


# if not (argv.nohead)
#   print "---"
#   print "layout: other"
#   print "---"

#   print ""
#   print "Papers co-authored by Vittorio Zaccaria"
#   print ""

print_what = (data, what) ->
       data.forEach (d) ->

        if not argv.published or argv.published and (not ('accepted' in d.keyword))
          if(what in d.keyword)
            print_conference d if what == "conference"
            print_conference d if what == "workshop"
            print_journal d    if what == "journal"
            print_patent d     if what == "patent"
            print_conference d if what == "bookc"
            print_book d       if what == "book"


print_stats = (data) ->
  s = _.countBy(data.records, (r) ->
     return "workshop" if("workshop" in r.keyword)
     if ("conference" in r.keyword)
      return "date-conference" if(_.str.include(r.booktitle.toLowerCase(), "date"))
      return "dac-conference"  if(_.str.include(r.booktitle.toLowerCase(), "dac"))
      return "conference"
     if ("journal" in r.keyword)
        return "transactions" if(_.str.include(r.journal.name.toLowerCase(), "transaction"))
        return "journal"
     return "book" if "book" in r.keyword
     return "book-chapter" if "bookc" in r.keyword
     return "patent" if "patent" in r.keyword)

  print "| **Conferences**: #{s['conference']+s['date-conference']+s['dac-conference']} | **Journals**: #{s['transactions']+s['journal']} |"
  print "|-----------------|--------------|"
  print "|    DATE:  #{s['date-conference']}          |    IEEE/ACM Transactions: #{s['transactions']} |"
  print "|    DAC/ASPDAC:  #{s['dac-conference']}     |    other: #{s['journal']}                      |"
  print "|    other: #{s['conference']}               |                                                |"
  print "| **Patents**: #{s['patent']}                | **Book Chapters**: #{s['book-chapter']}        |"
  print "| **Workshops**: #{s['workshop']}            | **Books**: #{s['book']}                        |"

# Main execution loop.
fs.readFile '/dev/stdin', 'utf8', (err, data) ->
    if (err>1)
       console.log("error")
    else
       o_js = JSON.parse(data)

       o_js.records.forEach (d) ->
         fix_names d
         fix_identifier d
         fix_month d
       # if not (argv.nohead)
       #  print_stats o_js

       orig_js = _.sortBy(o_js.records, (d) -> -1 * (_.toNumber(d.year)))

       console.log JSON.stringify(orig_js, null, 4)
       # print "### Journals"
       # print_what orig_js, "journal"
       # print ""
       # print ""
       # print "### Books"
       # print_what orig_js, "book"
       # print ""
       # print ""
       # print "### Patents"
       # print_what orig_js, "patent"
       # print ""
       # print ""
       # print "### Conferences"
       # print_what orig_js, "conference"
       # print ""
       # print ""
       # print "### Book chapters"
       # print_what orig_js, "bookc"
       # print ""
       # print ""
       # print "### Workshops"
       # print_what orig_js, "workshop"




