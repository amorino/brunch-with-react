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
        	<h1>'Allo, 'Allo!</h1>
        	<p>About</p>
        	<ul>
            	<li>Foo (Studio)</li>
        	</ul>
      	</div>

module.exports = About