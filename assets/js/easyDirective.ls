

debug = require('debug')('easy-directive')
teacup = require 'teacup'
_      = require 'underscore'

{ div, render, p, img, i } = teacup 

style = ->

    extend = (object, properties) ->
      for key, value of properties
        object[key] = value
      object

    compile = (rules) ->
      css = ''

      for selector, pairs of rules
        declarations = ''
        nested = {}

        #add mixins to the current level
        if {mixin} = pairs
          delete pairs.mixin
          unless mixin instanceof Array
            mixin = [mixin]
          for mix in mixin
            extend pairs, mix

        #a pair is either a css declaration, or a nested rule
        for key, value of pairs
          if typeof value is 'object'
            nested["#{selector} #{key}"] = value
          else
            #borderRadius -> border-radius
            key = key.replace /[A-Z]/g, (s) -> '-' + s.toLowerCase()
            declarations += "  #{key}: #{value};\n"

        if declarations
          #we have to check; this level could just be for nesting.
          css += selector + ' {\n'
          css += declarations
          css += '}\n'

        css += compile nested

      css

    return {
        compile: compile
    }

render-css = style().compile



class _directive 
    (@name) ->
        @_byval = []
        @_byvar = []
        @_template = ""
        @injected = []
        @_callbacks = []

    byref: ~>
        @_byvar = @_byvar ++ Array.prototype.slice.call(&)

    byval: ~>
        @_byval = @_byval ++ Array.prototype.slice.call(&)

    callback: ~>
        @_callbacks = @_callbacks ++ Array.prototype.slice.call(&)

    import: ~>
        for a in &
            @injected.push(a)

    template: ~>
        @_template = render it

    style: ~>
        @_style = render-css it()

    transclude: ~>
        @_transclude = true

    create: (cb) ~>
        @creation = cb



directive = (name, constructor) ->
    d = new _directive(name)
    constructor.apply(d)

    ret = {}
    ret.restrict = 'A'
    ret.template = d._template 
    ret.style = d._style
    if d._template == ""
        ret.replace = false
    else
        ret.replace = true
    ret.scope = {};
    ret.create = d.creation
    ret.transclude = d._transclude if d._transclude?

    debug("Building directive data")

    for l in d._byval 
        ret.scope[l] = '@'

    for r in d._byvar 
        ret.scope[r] = '='

    for c in d._callbacks
        ret.scope[r] = '&'

    debug("Built. ")
    ret.build-it = ->

        debug "Invoked built-it"
        args = Array.prototype.slice.call(&)
        # debug ret.template
        # debug ret.style
        angular.element(document).find('head').prepend("<style type='text/css'>#{ret.style}</style>");
        tobj = {}

        for i from 0 to (args.length - 1)
            v = args[i]
            n = d.injected[i]
            tobj[n] = v

        ret.link = (scope, elem, attr) ->

            for k,v of tobj
                # debug "Registering scope.#k = #v"
                scope[k] = v

            # debug "Directive scope"

            scope.on-change = (v, f) ->
               scope.$watch(v, f.bind(scope)) 

            ret.create.apply(scope, [elem, attr])

        return ret

    dirargs = ret.build-it
    if d.injected.length > 0 
        dirargs = d.injected ++ dirargs

    debug JSON.stringify(dirargs)

    angular.module('application').directive(d.name, dirargs)



debug "Registering directive"

module.exports = _.extend({directive: directive}, teacup)





        