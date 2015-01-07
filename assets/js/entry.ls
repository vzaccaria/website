
welcome = '''

#                     __                        
#      _      _____  / /________  ____ ___  ___ 
#     | | /| / / _ \\/ / ___/ __ \\/ __ `__ \\/ _ \
#     | |/ |/ /  __/ / /__/ /_/ / / / / / /  __/
#     |__/|__/\\___/_/\\___/\\____/_/ /_/ /_/\\___/ 
#                                               
# This is my web-page. It was all designed and implemented by myself. 
'''

#                     __                        
#      _      _____  / /________  ____ ___  ___ 
#     | | /| / / _ \/ / ___/ __ \/ __ `__ \/ _ \
#     | |/ |/ /  __/ / /__/ /_/ / / / / / /  __/
#     |__/|__/\___/_/\___/\____/_/ /_/ /_/\___/ 
#                                               
console.log welcome 

add-fast-click = ->
    FastClick.attach(document.body);

window.addEventListener 'load', add-fast-click, false

application = angular.module('application', ['ngTable'])

add-reddit-button = (selector) ->

    thisurl = encodeURIComponent(window.location.href);
    title   = encodeURIComponent(document.title)

    click-handler = -> 
        window.location = "http://www.reddit.com/submit?url=#thisurl&title=#title" 
        return false
    jQuery(selector).click(click-handler)


add-twitter-button = (selector) ->
    thisurl = encodeURIComponent(window.location.href);
    via = encodeURIComponent('_vzaccaria_')
    text = encodeURIComponent('Hei! Check out this link: ')
    click-handler = -> 
        window.location = "https://twitter.com/share?url=#thisurl&via=#via&text=#text" 
        return false
    jQuery(selector).click(click-handler)



add-google-tracking = ->
    url = "http://www.google-analytics.com/urchin.js"
    jQuery.getScript url, (script, success) ->
        if success
                _uacct = "UA-4069654-2"
                urchinTracker(); 


application.controller 'pageController', ($scope, $filter, $http, ngTableParams) ->

    orig-data = 
        {data: 1}
        {data: 2}
        ...

    numpar = 
        page: 1
        count: 10
         

    otherpar =
        total: orig-data.length
        getData: ($defer,params) ->

             tags-to-look = [\esame \esami \soluzione \soluzioni \esercizio ]

             {baseUrl} = require('../../site.json')

             $http({method: 'GET', url: "#baseUrl/data/index.json" }).success ->
                orig-data   = _.filter it, -> 
                    (it.category == 'infob') && (_.intersection(tags-to-look, it.tags).length > 0)

                $scope.temi = $filter('filter')(orig-data, params.filter()) 
                $defer.resolve($scope.temi)

    $scope.tableParams = new ngTableParams(numpar, otherpar)

jQuery(document).ready ->
    add-reddit-button('.share_buttons__share_reddit')
    add-twitter-button('.share_buttons__share_twitter')
    add-google-tracking()

 