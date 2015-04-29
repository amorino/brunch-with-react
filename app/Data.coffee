Requester = require "lib/requester"

class Data
    url:[]
    id:[]
    locale:'es-mx'
    name:"::Foo::"
    userInfo:null

    constructor:(@callback=null)->
        @init()
        # @getUserInfo()

    init:=>
        if App.LIVE
            @url.endPoint = "//private-a85a3-unbreakeable.apiary-mock.com"
            @id.FB = "668174739995434"
            @id.GA = "ua2423423"
        else
            @url.endPoint = "//private-a85a3-unbreakeable.apiary-mock.com"
            @id.FB = "668174739995434"
            @id.GA = "ua2423423"

        # @getUserInfo()
        @callback?()
        null

    getUserInfo:=>
        Requester.request
            type: 'POST'
            url: @url.endPoint + "/gallery"
            dataType: "json"
            data:
                "email"     : "homero.sousa@gmail.com"
                "raceNumber": "12345"
            done: (e)=>
                @isRequestUserInfo = true
                @onRequestDone(e,"userInfo")
            fail: (e)=>
                @isRequestingSuggestion = false
                @onRequestError(e)

        null


    onRequestDone:(e, type=null) =>
        if type is "userInfo"
            @userInfo = e

        null

    onRequestError:()=>
        console.log "something is wrong"

module.exports = Data

