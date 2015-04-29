# @cjsx React.DOM
'use strict'

About = React.createClass
	displayName: 'About'

	render: ->
		# console.log 'render Home: ', @props
		styles = {}
		hH = @props.params.site.header_height
		styles['padding-top'] = if hH then hH else 0

		<div className="hero-unit" style={styles}>
        	<h1>Welcome</h1>
        	<p>About</p>
      	</div>

module.exports = About