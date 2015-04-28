Facebook  = require "lib/facebook"

class AuthManager
    constructor:()->
        if App.debug
            console.info "Auth Manager init"

    login:(service,callback=null)=>
        $dataDfd = $.Deferred()
        switch service
            when 'facebook'
                if App.debug
                    console.info "switch", service
                Facebook.login $dataDfd

        $dataDfd.done (res) => @authSuccess service, res
        $dataDfd.fail (res) => @authFail service, res
        $dataDfd.always () => @authCallback callback

        return
        # $dataDfd

    authSuccess:(service,response)->
        if App.debug
            console.info "login success", response
        return

    authFail:(service, response) ->
        if App.debug
            console.info "login fail", response
        return

    authCallback:(callback=null)->
        callback?()
        return

module.exports = AuthManager
