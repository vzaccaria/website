
_ = require 'lodash'
moment = require 'moment'

_module = ->

  colors = {

    contests   : '#8e44ad'
    edit       : '#d35400'
    routing    : '#3498db' # blue
    profile    : '#7f8c8d'
    directive  : '#34495e'
    modelStore : 'red'
    
  }

  debug-enable = true 

  debug-msg = ->
    if debug-enable
      module = &0
      # console.group()
      for x in &[1 to]
        console.log "%cinfoweb-#module: %c#x", "color: #{colors[module]}", "color: black"
      # console.group-end()

  debug-object = (s) ->
    # cleaned = _.omit s, (v,k) ->
    #     if k == /\$/g
    #         return true 
    #     else 
    #         if _.is-function(v) or _.is-object(v) or _.is-null(v)
    #             return true
    #         return false
    # # console.log JSON.stringify(cleaned, null, 4) 
    # # console.table [ cleaned ]
    console.log s

  debug-contest = (ss) ->
    if not _.is-array(ss)
      ss = [ ss ]
    cc = []  

    for s in ss
      c = {}
      c.id = s.id 
      c.ends = moment(s.end_time).format('DD MM YY')
      cc.push(c)

    console.table cc

  debug-user = (ss) ->
    if not _.is-array(ss)
      ss = [ ss ]
    cc = []  

    for s in ss
      c = {}
      c.id = s.id 
      c.is_teacher = s.is_teacher
      cc.push(c)

    console.table cc

  get-debug-msg = (m) ~>
    ~> debug-msg.apply(this, [ m ] ++ &[0 to])
          
  iface = { 
      get-debug-msg: get-debug-msg
      debug-user: debug-user
      debug-contest: debug-contest
      debug-object: debug-object
  }
  
  return iface
 
module.exports = _module()


