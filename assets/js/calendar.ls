
{ directive }        = require('./easyDirective.ls')
{ render, div, raw } = require('teacup')
_                    = require('lodash')
moment               = require('moment')
debug                = require('debug')('calendar')
_s                   = require('underscore.string')

directive "calendar", ->
    debug("Creating calendar..")

    @import '$http'
    @byval \startMonth, \numberOfMonths, \format, \url 

    tooltip = render ->
        div '.calendar__tooltip', { "ng-show": 'day.tooltipVisible' }, -> 
            div '.calendar__tooltip__title', '{{day.title}}'

    # console.log JSON.stringify(tooltip)

    @template ->
        div '.calendar', ->
            div '.calendar__month', "ng-repeat": "month in months", ->
                div '.calendar__month_name', '{{month.name}}'
                div '.calendar__day', {
                            "ng-repeat"     : "day in month.days",
                            "ng-class"      : "day.type",
                            "ng-click"      : "gotoDay(day)",
                            "ng-mouseenter" : 'showTooltip(day)',
                            "ng-mouseleave" : 'hideTooltip(day)',
                            style         : "{{day.style}}" 
                            }, -> 
                                raw("{{day.number}} #tooltip")
                    

    @create (elem, attr) ->

        @isInMonth = (cd, cm) ~>
            cm.month() == day.month()

        @isSunday = (cd) ~>
            cd.day() == 0

        @showTooltip = (day) ~>
            if day.link?
                day.tooltipVisible = true 


        @hideTooltip = (day) ~>
            day.tooltipVisible = false

        @loadData = ~>
            @['$http']({method: 'GET', url: @url }).success (d) ~>
                @data = _.indexBy d, ~>
                    @getUniformDate(moment(it.date))
                debug "Data loaded - updating calendar"    
                @updateCalendar();

        @gotoDay = (d) ~>
            window.location.href = d.link if d.link?

        @getUniformDate = (d) ~>  
            return d.format('DD-MM-YYYY');

        @filter = (arg) ~>
            arg.category == 'infob'


        @getAdditionalInfo = (cd) ~>
            cd = @getUniformDate(cd);
            if @data? and @data[cd]?
                if (not @filter?) or @filter(@data[cd])
                    return {
                        title: @data[cd].title, 
                        category: "calendar__category_"+@data[cd].category, 
                        tags: @data[cd].tags, 
                        link: @data[cd].link                        
                        }
            return undefined

        @updateCalendar = ~>
            @format ?= "MMMM YYYY"
            @months = [];
            cm = moment(@startMonth, @format).startOf('month');
            for i in [ 1 to parseInt(@numberOfMonths) ]
                maxdays = cm.daysInMonth();
                cd = moment(cm);
                days = []
                if not @isSunday(cd) 
                    for k in [ 0 to (cd.day() - 1) ]
                        days.push {
                            type: 'calendar__day_not_in_month', 
                            number: 'NA', 
                            date: moment(cd) 
                        }

                month-name = cd.format('MMMM')

                for j in [ 1 to maxdays ]
                    info = @getAdditionalInfo(cd)
                    dd = {
                        number         : cd.date()
                        date           : moment(cd)
                        tooltipVisible : false
                    }
                    if info?
                        dd.link  = info.link
                        dd.title = info.title
                        dd.style = 'cursor: pointer'
                        dd.type  = [ info.category ] ++ info.tags.map -> "calendar__tag_#{_s.underscored(it)}"

                    today = @getUniformDate(moment())        
                    this_day = @getUniformDate(cd)
                    dd.type = ['calendar__day_is_today'] ++ dd.type if (today == this_day)
                    dd.type = ['calendar__day_not_working'] ++ dd.type if (cd.day() == 0 || cd.day() == 6)
                    dd.type = ['calendar__day_working'] ++ dd.type if not (cd.day() == 0 || cd.day() == 6)
                    days.push(dd)
                    cd.add(1, 'day')
                @months.push({name: month-name, days: days})
                cm.add(1, 'month')

            debug @months

        group =  ['startMonth', 'numberOfMonths', 'data', 'filter']
        @$watchCollection(group, @updateCalendar)
        setTimeout(@loadData, 0);

