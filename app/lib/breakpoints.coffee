class Breakpoint


    constructor:(@callback)->
        @data = isMobile
        @mobile()
        @browser()
        @callback?()
        return

    mobile:=>
        _.map @data, (v,k) ->
            if typeof v isnt 'object' and v is true
                $('body').addClass(k)

            if typeof v is 'object'
                for key, val of v
                    if val is true
                        $('body').addClass(k)

        return

    browser:->
        $('body').addClass bowser.name
        $('body').addClass bowser.version
        return
                

module.exports = Breakpoint