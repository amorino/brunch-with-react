# @cjsx React.DOM
'use strict'

Home = React.createClass
	displayName: 'Home'

	render: ->
		#console.log 'render Home: ', @props
		styles = {}
		hH = @props.params.site.header_height
		styles['padding-top'] = if hH then hH else 0

		<div className="hero-unit" style={styles}>
        	<h1>Welcome</h1>
        	<p>Home</p>
      	</div>

module.exports = Home