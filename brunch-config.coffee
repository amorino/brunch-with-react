exports.config =
	plugins:
		react:
			autoIncludeCommentBlock: yes
		sass:
			options:
				includePaths: ['bower_components/bootstrap-sass/assets/stylesheets']
	files:
		javascripts:
			joinTo:
				'javascripts/app.js': /^app/
				'javascripts/vendor.js': /^(?!app)/
			order:
				before: [
					'bower_components/jquery/dist/jquery.js',
					'bower_components/react/react-with-addons.min.js'
				]
		stylesheets:
      		defaultExtension: 'scss'
      		joinTo: 
        		'styles/app.css': /^(app)/
        		'styles/vendor.css': /^(?!app)/