
welcome = '''
#                     __                        
#      _      _____  / /________  ____ ___  ___ 
#     | | /| / / _ \\/ / ___/ __ \\/ __ `__ \\/ _ \
#     | |/ |/ /  __/ / /__/ /_/ / / / / / /  __/
#     |__/|__/\\___/_/\\___/\\____/_/ /_/ /_/\\___/ 
#                                               
# This is my web-page. It was all designed and implemented by me. 
# You are using dev tools so you might be interested in the details:
# 
# * CSS is custom and follows BEM naming conventions 
# * It uses DynCSS for some easy page adaptation.
'''

#                     __                        
#      _      _____  / /________  ____ ___  ___ 
#     | | /| / / _ \/ / ___/ __ \/ __ `__ \/ _ \
#     | |/ |/ /  __/ / /__/ /_/ / / / / / /  __/
#     |__/|__/\___/_/\___/\____/_/ /_/ /_/\___/ 
#                                               
console.log welcome 
# window.dynCss.config.dontComputeInvisible = true
# window.dynCss.config.debug = true
# window.dynCss.config.useRAF = true

window.dynCss.lib.responsiveTranslateX = (v1, v2) ->
    return window.dynCss.lib.selectFrom(["translateX(#{v1}px)", "translateX(#{v2}px)"])

add-fast-click = ->
    FastClick.attach(document.body);

window.addEventListener 'load', add-fast-click, false

application = angular.module('application', [])

# Apply it to the div that will contain the widget:
# 
# .share_buttons__share_reddit(style="cursor: pointer")
#    i.fa.fa-reddit 


add-reddit-button = (selector) ->

    thisurl = encodeURIComponent(window.location.href);
    title   = encodeURIComponent(document.title)

    click-handler = -> 
        window.location = "http://www.reddit.com/submit?url=#thisurl&title=#title" 
        return false
    jQuery(selector).click(click-handler)

# Apply it to the div that will contain the widget:
# 
# .share_buttons__share_twitter(style="cursor: pointer")
#    i.fa.fa-twitter 


add-twitter-button = (selector) ->
    thisurl = encodeURIComponent(window.location.href);
    via = encodeURIComponent('_vzaccaria_')
    text = encodeURIComponent('Hei! Check out this link: ')
    click-handler = -> 
        window.location = "https://twitter.com/share?url=#thisurl&via=#via&text=#text" 
        return false
    jQuery(selector).click(click-handler)



add-google-tracking = ->
    console.log "Getting google."
    url = "http://www.google-analytics.com/urchin.js"
    jQuery.getScript url, (script, success) ->
        if success
                _uacct = "UA-4069654-2"
                urchinTracker(); 

jQuery(document).ready ->
    add-reddit-button('.share_buttons__share_reddit')
    add-twitter-button('.share_buttons__share_twitter')
    add-google-tracking()

 