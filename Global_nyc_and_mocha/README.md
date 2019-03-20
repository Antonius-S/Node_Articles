Make globally installed `nyc` and `mocha` work together
=======================================================

**Problem**: when `nyc` and `mocha` both installed globally, `nyc` produces zero coverage info.
Ref: https://github.com/istanbuljs/nyc/issues/1029

*Issue seems to be Windows-only*

Here is minimal solution.

Requirements
------------

Solution presumes you have Node in `%PATH%` and `mocha` installed in `%NodeDir%\node_modules\mocha`.
Shell script is for Windows only (things seem to work on Linux)

For shell
---------

This enables running `nyc npm test` from shell and **VSCode**

Place [`mocha.cmd`](mocha.cmd) file to subdirectory `node_modules\.bin` of your repo.

For VS Code
-----------

This enables debugging with breakpoints from **VSCode**

Place [`mocha`](mocha) file to subdirectory `node_modules\.bin` of your repo.

Add following launch configuration to `launch.json` (either global or repo-local):
```
	"launch": {
		...
		"configurations": [
			...
			{
				"name": "Run mocha",
				"type": "node",
				"request": "launch",
				"program": "${workspaceRoot}/node_modules/.bin/mocha",
				"stopOnEntry": false,
				"args": ["--ui", "tdd", "${workspaceRoot}/test/test.js"],
				"cwd": "${workspaceRoot}",
				"runtimeExecutable": null,
				"env": { "NODE_ENV": "production"}
		}]
	}
```
*Adjust labels, mocha args and other properties as you like*