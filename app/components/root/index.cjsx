# @cjsx React.DOM
'use strict'

# Stores

Constants = require 'components/site/const'
Actions = require 'components/site/actions'
Store = require 'components/site/store'

# Helpers and utilities
SyncState = require 'util/mixins/syncstate'

# Routing
Router = window.ReactRouter
{ DefaultRoute, Link, Route, RouteHandler, Redirect, NotFoundRoute } = Router
TransitionGroup = React.addons.CSSTransitionGroup

# Child views
Header = require 'components/header'
Home = require 'components/home'
About = require 'components/about'

# Moduel global functions and variables
pages = ['home', 'about']

Root = React.createClass
	displayName: 'Root'
	mixins: [ Router.State, SyncState]
	contextTypes: 
		router: React.PropTypes.func
	stores:
		site: Store

	render: ->
		#console.log @state.site
		# name = @getRoutes().reverse()[0].name
		router = @context.router;
		@name = @getRoutes()[1].name
		#console.log @name

		# Determine page-slide transition direction

		<div id="Root">
			<Header />
			<TransitionGroup transitionName="example" component='div' className='container'>
				<RouteHandler key={@name}/>
			</TransitionGroup>
		</div>

	componentDidMount: ->
 		Actions.call null, Constants.SET_HEADER_HEIGHT, document.getElementById('header').getBoundingClientRect().height

# Route Definitions
routes = (
  <Route name="app" handler={Root} path="/">
    <DefaultRoute handler={Home} />
    <Route name="home" handler={Home} />
    <Route name="about" handler={About} />
    <NotFoundRoute handler={Home}/>
    <Redirect from="/" to="home" />
  </Route>
)

Router.run routes, Router.HistoryLocation,  (Handler) ->
	React.render <Handler />, document.getElementById('content')

# Successfully required in
module.exports = true