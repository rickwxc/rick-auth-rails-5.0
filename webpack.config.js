var path = require('path');
var webpack = require('webpack');

var config = module.exports = {
  // the base path which will be used to resolve entry points
  context: __dirname,
  // the main entry point for our application's frontend JS
  //entry: './app/frontend/javascripts/entry.js',

  entry: {
	  entry: "./app/frontend/javascripts/entry.js",
	  entry2: "./app/frontend/javascripts/entry2.js"
  },

module: {
    loaders: [
	  { test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "url-loader?limit=10000&minetype=application/font-woff" },
	  { test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "file-loader" },
	  { test: /\.css$/, loader: "style!css" },
	  { test: /\.png$/, loader: "url-loader?mimetype=image/png&limit=8192" },

    ]
  },
};

config.output = {
  // this is our app/assets/javascripts directory, which is part of the Sprockets pipeline
  path: path.join(__dirname, 'app', 'assets', 'javascripts'),
  // the filename of the compiled bundle, e.g. app/assets/javascripts/bundle.js
  //filename: 'bundle.js',
  filename: "[name].js",
  // if the webpack code-splitting feature is enabled, this is the path it'll use to download bundles
  publicPath: '/assets',
};

config.resolve = {
  // tell webpack which extensions to auto search when it resolves modules. With this,
  // you'll be able to do `require('./utils')` instead of `require('./utils.js')`
  extensions: ['', '.js'],
  // by default, webpack will search in `web_modules` and `node_modules`. Because we're using
  // Bower, we want it to look in there too
 // modulesDirectories: [ 'node_modules', 'bower_components' ],
};

config.plugins = [
  // we need this plugin to teach webpack how to find module entry points for bower files,
  // as these may not have a package.json file
  new webpack.ProvidePlugin({
	    $: 'jquery',
	    jQuery: 'jquery',
  }),
  new webpack.ResolverPlugin([
    new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin(['main'])
  ])
];
