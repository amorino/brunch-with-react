# @cjsx React.DOM
'use strict'

# Stores

SiteConst = require 'components/site/const'
SiteActions = require 'components/site/actions'
SiteStore = require 'components/site/store'

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
	mixins: [SyncState, Router.State]
	stores:
		site: SiteStore

	render: ->
		# console.log 'render', @state
		# Determine page-slide transition direction
		<div id="Root">
			<Header />
			<TransitionGroup transitionName="page">
				<RouteHandler params={{site: @state.site}} />
			</TransitionGroup>
		</div>

	componentDidMount: ->
		SiteActions.call null, SiteConst.SET_HEADER_HEIGHT, document.getElementById('Header').getBoundingClientRect().height

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