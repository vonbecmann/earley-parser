keymaps
openBrowserInEarleyEnvironmentShortcut
	<shortcut>
	^ KMKeymap
		named: 'openSystemBrowserInEarley'
		shortcut: $o meta , $e meta
		action: [ JEEarleyUI openBrowserInEarleyEnvironment ]