### [2.0]
* Removed automatic of require due to problems with running in browser and using Webpack on the client.

### [1.0.7]
* Use dynamic loading of fs when running on node. This avoid Webpack trying to load it.

### [1.0.6]
* Changed isNode detection. Other mechanism did now work when bundled with Webpack.

### [1.0.5]
* Changed missed const to var

### [1.0.4]
* Same for let 

### [1.0.3]
* Changed const to var to avoid needing to run babelify on files in node_modules

### [1.0.2]
* Fixed bug where existing loggers were not being updated on config changes when no levels categories were present.

### [1.0.1]
* Support for running in browser. Ignores all file/watch operations.

### [1.0.0]
* Initial release.
