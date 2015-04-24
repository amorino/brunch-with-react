# @cjsx React.DOM
'use strict'

Home = React.createClass
	displayName: 'Home'

	render: ->
		# console.log 'render Home: ', @props
		styles = {}
		hH = @props.params.site.header_height
		styles['padding-top'] = if hH then hH else 0

		<div className="hero-unit" style={styles}>
        	<h1>'Allo, 'Allo!</h1>
        	<p>Home</p>
        	<ul>
            	<li>Foo (Studio)</li>
        	</ul>
      	</div>

module.exports = Home