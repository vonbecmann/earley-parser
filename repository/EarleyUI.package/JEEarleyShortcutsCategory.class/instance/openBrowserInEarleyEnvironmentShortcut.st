keymaps
openBrowserInEarleyEnvironmentShortcut
	<shortcut>
	^ KMKeymap
		named: 'openSystemBrowserInEarley'
		shortcut: $o alt unix , $e alt unix , $b alt unix
		action: [ JEEarleyUI openBrowserInEarleyEnvironment ]