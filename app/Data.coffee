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
            @url.endPoint = ""
            @id.FB = ""
            @id.GA = ""
        else
            @url.endPoint = ""
            @id.FB = ""
            @id.GA = ""

        # @getUserInfo()
        @callback?()
        null

    getUserInfo:=>
        Requester.request
            type: 'POST'
            url: @url.endPoint + "/gallery"
            dataType: "json"
            data:
                "email"     : "erick@foostudio.mx"
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

