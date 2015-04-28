class Requester

    @request: ( data ) ->

        r = $.ajax
            url         : data.url
            type        : if data.type then data.type else "POST",
            data        : if data.data then data.data else null,
            dataType    : if data.dataType then data.dataType else "json",
            contentType : if data.contentType then data.contentType else "application/x-www-form-urlencoded; charset=UTF-8",
            processData : if data.processData != null and data.processData != undefined then data.processData else true

        # console.log data.done
        r.done data.done
        r.fail data.fail

        r

module.exports = Requester
