#partials
Swag.Config.partialsPath = '../views/templates/'
Swag.registerHelpers()

#handlebars.js

Backbone.View.prototype.leave = ->
    @remove()
    @off()
    if @childViews
        @childViews.forEach (v) -> v.leave()


Marionette.Region.prototype.attachHtml = (view) ->
	@$el.hide()
	@$el.html(view.el)
	@$el.fadeIn("slow")