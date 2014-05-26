
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
