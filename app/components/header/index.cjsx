# @cjsx React.DOM
'use strict'

#React-Bootstrap
Panel = ReactBootstrap.Panel
Navbar = ReactBootstrap.Navbar
Nav = ReactBootstrap.Nav

#React-Bootstrap-Router
NavItemLink = ReactRouterBootstrap.NavItemLink

Header = React.createClass
	displayName: 'Header'

	render: ->
		# console.log 'render Header: ', @props
		<header id="header">
			<Navbar brand='React-Brunch' toggleNavKey={0}>
		    	<Nav eventKey={0}>
		      		<NavItemLink to='home' href='#'>Home</NavItemLink>
		      		<NavItemLink to='about' href='#'>About</NavItemLink>
		    	</Nav>
		  	</Navbar>
		</header>

module.exports = Header