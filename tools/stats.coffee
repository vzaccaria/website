#!/usr/bin/env coffee

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
  "zaccaria"        : { name  : "Vittorio      Zaccaria", other    : false }
  "palermo"         : { name  : "Gianluca      Palermo", other     : false }
  "silvano"         : { name  : "Cristina      Silvano", other     : false }
  "sami"            : { name  : "Mariagiovanna Sami", other        : false }
  "sciuto"          : { name  : "Donatella     Sciuto", other      : false }
  "fornaciari"      : { name  : "William       Fornaciari", other  : false }
  "piuri"           : { name  : "Vincenzo      Piuri", other       : true }
  "zafalon"         : { name  : "Roberto       Zafalon", other     : true }
  "bona"            : { name  : "Andrea        Bona", other        : true }
  "prestileo"       : { name  : "Andrea        Prestileo", other   : true }
  "benini"          : { name  : "Luca          Benini", other      : true }
  "mariani"         : { name  : "Giovanni      Mariani", other     : true }
  "salvemini"       : { name  : "Lorenzo       Salvemini", other   : true }
  "bertels"         : { name  : "Koen          Bertels", other     : true }
  "sima"            : { name  : "Vlad          Mihai Sima", other  : true }
  "bertoni"         : { name  : "Guido         Bertoni", other     : true }
  "bircan"          : { name  : "Aril          Bircan", other      : true }
  "breveglieri"     : { name  : "Luca          Breveglieri", other : true }
  "fragneto"        : { name  : "Pasqualina    Fragneto", other    : true }
  "macchetti"       : { name  : "Marco         Macchetti", other   : true }
  "valsecchi"       : { name  : "Simone        Valsecchi", other   : true }
  "monchier"        : { name  : "Matteo        Monchiero", other   : true }
  "chinosi"         : { name  : "Mauro         Chinosi", other     : true }
  "Bruni"           : { name  : "Davide        Bruni", other       : true }
  "pagni"           : { name  : "Andrea        Pagni", other       : true }
  "lucini"          : { name  : "Fabrizio      Lucini", other      : true }
  "pau"             : { name  : "Danilo Pietro Pau", other         : true }
  "borneo"          : { name  : "Antonio       Borneo", other      : true }
  "soti"            : { name  : "Sotiris       Xydis", other       : false }
  "aone"            : { name  : "Edoardo       Paone", other       : true }
  "reghiz"          : { name  : "Stefano Crespi Reghizzi", other   : false }
  "elpign"          : { name  : "Diego         Melpignano", other  : true }
  "ossei"           : { name  : "Amir          Ashouri", other     : false }
  "iacomo"          : { name  : "Giacomo       Marchiri", other    : true }
  "augou"           : { name  : "Germain       Haugou", other      : true }
  "epley"           : { name  : "Thierry       Lepley", other      : true }
  "Agosta"          : { other : false }
  "Bellasi"         : { other : false }
  "Castro"          : { other : false }
  "Corbetta"        : { other : false }
  "Speziale"        : { other : false }
  "Zins"            : { other : true }
  "Hubert"          : { other : true }
  "Stabernack"      : { other : true }
  "Brandenburg"     : { other : true }
  "Palkovic"        : { other : true }
  "Raghavan"        : { other : true }
  "Ykman-Couvreur"  : { other : true }
  "Anagnostopoulos" : { other : true }
  "Bartzas"         : { other : true }
  "Soudris"         : { other : true }
  "Kempf"           : { other : true }
  "Ascheid"         : { other : true }
  "Ansari"          : { other : true }
  "Mahonen"         : { other : true }
  "Vanthournout"    : { other : true }
  "Vahabi"          : { other : true }
  "Marceglia"       : { other : false }
  "Pagliari"        : { other : true }
  "Pinciroli"       : { other : false }
  "Matos"           : { other : true }
  "Reinbrecht"      : { other : true }
  "Susin"           : { other : true }
  "Carro"           : { other : true }
  "Wouters"         : { other : true }
  "Kavka"           : { other : true }
  "Onesti"          : { other : true }
  "Turco"           : { other : true }
  "Bondi"           : { other : true }
  "Posadas"         : { other : true }
  "Villar"          : { other : true }
  "Wu"              : { other : true }
  "Dongrui"         : { other : true }
  "Hao"          : { other : true }
  "Shibin"       : { other : true }
  "Siorpaes"     : { other : true }
  "Huebert"      : { other : true }
  "Meyr"         : { other : true }
  "Martinez"     : { other : true }
  "Bocchio"      : { other : true }
  "Avasare"      : { other : true }
  "Vanmeerbeeck" : { other : true }
  "Biagio"       : { other : true }
  "Tartara"      : { other : true }
  "Xydis"        : { other : true }
  "Rigoni"       : { other : true }
  "Brankovic"    : { other : true }
  "Jovic"        : { other : true }
  "Gellert"      : { other : true }
  "Florea"       : { other : true }
  "Vintan"       : { other : true }
  "Choudury"     : { other : true }

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

format_name = (n) ->
   cn = _.words(n)
   cn[0] = cn[0][0]+". "
   return _.clean(_.toSentence(cn, ' ', ' '))


fix_names = (r) ->


  nauthors = 0
  other = 0
  
  r.author.forEach (a) ->

    nauthors = nauthors + 1

    cn = _.words(a.name, ",")

    if cn[1]?
      nn = _.clean(cn[1]+". "+cn[0])
    else
      nn = a.name

    a.name = nn

    found = false

    for short, long of patt
      if _.str.include(a.name.toLowerCase(), short.toLowerCase())
        if long.name? 
          a.name = format_name long.name
        found = true
        if long.other 
          other = other + 1
    if not found 
      console.log a.name 

    delete a.id
  return { nauthors: nauthors, other: other }


getauthors = (d) ->
  return _.toSentence(d.author.map (m) -> m.name);
  # names = d.author.map (m) -> m.name;
  return "#{names[0]} *et al.*"



print_what = (data, what) ->
       data.forEach (d) ->

        if(what in d.keyword)
          print_conference d if what == "conference"
          print_conference d if what == "workshop"
          print_journal d    if what == "journal"
          print_patent d     if what == "patent"
          print_conference d if what == "bookc"
          print_book d       if what == "book"


# Main execution loop.
fs.readFile '/dev/stdin', 'utf8', (err, data) ->
    if (err>1)
       console.log("error")
    else
       o_js = JSON.parse(data)

       tot = 0
       nother = 0
       o_js.records.forEach (d) ->
         { nauthors, other } = fix_names(d)
         tot = tot + nauthors
         nother = nother + other 

       console.log tot, nother, nother/tot

