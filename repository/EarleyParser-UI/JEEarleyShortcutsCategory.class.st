"
global shortcuts.

"
Class {
	#name : #JEEarleyShortcutsCategory,
	#superclass : #KMCategory,
	#category : 'EarleyParser-UI'
}

{ #category : #testing }
JEEarleyShortcutsCategory class >> isGlobalCategory [

	^ true 
]

{ #category : #keymaps }
JEEarleyShortcutsCategory >> openBrowserInEarleyEnvironmentShortcut [
	<shortcut>
	^ KMKeymap
		named: 'openSystemBrowserInEarley'
		shortcut: $o meta , $e meta
		action: [ JEEarleyUI openBrowserInEarleyEnvironment ]
]
