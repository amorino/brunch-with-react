Data = require "Data"

class Facebook

    @url         : '//connect.facebook.net/en_US/all.js'

    @permissions : 'email'

    @$dataDfd    : null
    @loaded      : false

    @load : ->

        $.getScript(@url).done(@init)

        null

    @init : =>
        console.log Data()
        @loaded = true

        FB.init
            appId  : Data.id.FB
            status : false
            version: 'v2.2'

        null

    @login : (@$dataDfd) =>
        FB.login ( res ) =>
            console.log "FB response", res

            if res['status'] is 'connected'
                @getUserData res['authResponse']['accessToken']
            else
                @$dataDfd.reject ':('

        , { scope: @permissions }

        null

    @getUserData : (token) =>

        userData = {}
        userData.access_token = token

        $meDfd   = $.Deferred()
        $picDfd  = $.Deferred()

        FB.api '/me', (res) ->

            userData.full_name = res.name
            userData.social_id = res.id
            userData.email     = res.email or false
            $meDfd.resolve()

        FB.api '/me/picture', { 'width': '200' }, (res) ->

            userData.profile_pic = res.data.url
            $picDfd.resolve()

        $.when($meDfd, $picDfd).done => @$dataDfd.resolve userData

        null

    @share : (opts, cb) ->

        FB.ui {
            method      : opts.method or 'feed'
            name        : opts.name or ''
            link        : opts.link or ''
            picture     : opts.picture or ''
            caption     : opts.caption or ''
            description : opts.description or ''
        }, (response) ->
            cb?(response)

        null

module.exports = Facebook
