# @cjsx React.DOM
'use strict'
PageHeader = ReactBootstrap.PageHeader

Home = React.createClass
	displayName: 'Home'

	render: ->
		# console.log 'render Home: ', @props
		# styles = {}
		# hH = @props.params.site.header_height
		# styles['padding-top'] = if hH then hH else 0
		<div id='home'>
		<PageHeader>Home <small>Subtext</small></PageHeader>
		<p>Quisque at nibh porta, fermentum nulla ac, egestas metus. Nullam massa dui, lacinia in 
		tempus non, tempor a turpis. Donec porta odio ac leo varius vulputate. In vitae arcu ve
		l erat suscipit finibus. Aenean purus risus, hendrerit vitae ligula ultrices, malesuada
		ultricies tellus. Mauris id justo non ipsum aliquet malesuada. Vestibulum ut justo faucibus, 
		malesuada elit ac, commodo nulla. Sed eleifend, felis ut efficitur venenatis, leo dolor ullamcorper
		libero, at tempus quam odio nec nisi. Proin ultrices eros vitae mattis convallis. Proin eu felis nisi.
		Proin consectetur neque lorem, in consectetur massa vehicula ut. Interdum et malesuada fames ac ante
		ipsum primis in faucibus. </p>
		</div>

module.exports = Home