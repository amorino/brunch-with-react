# @cjsx React.DOM
'use strict'

view = (window or document)
view.App = require 'components/site'

options = {}

options.IS_LIVE = do -> return if window.location.host.indexOf('localhost') > -1 or window.location.search is '?d' then false else true

# Initialize React's touch events
React.initializeTouchEvents(true)

initialize = ->
	view.App.initialize( options )
	React.initializeTouchEvents(true)
	require 'components/root'
	# React.render <Root />, document.getElementById('Site-Container') if Root

initialize()