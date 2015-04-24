# @cjsx React.DOM
'use strict'

Header = React.createClass
	displayName: 'Header'

	render: ->
		# console.log 'render Header: ', @props
		<header id="Header">
			Header
		</header>

module.exports = Header