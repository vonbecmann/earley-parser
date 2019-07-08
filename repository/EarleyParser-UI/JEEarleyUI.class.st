"
browse earley environment

"
Class {
	#name : #JEEarleyUI,
	#superclass : #Object,
	#category : 'EarleyParser-UI'
}

{ #category : #environment }
JEEarleyUI class >> earleyEnvironment [
	| packageNames |
	packageNames := OrderedCollection with: BaselineOfEarleyParser package packageName.
	packageNames addAll: (BaselineOfEarleyParser project version packages collect: [ :each | each name ]).
	^ (RBBrowserEnvironment new forPackageNames: packageNames)
		label: 'Earley Parser Environment';
		yourself
]

{ #category : #'menu declaring' }
JEEarleyUI class >> earleyToolsOn: aBuilder [
	<worldMenu>
	(aBuilder group: #EarleyTools)
		withSeparatorAfter;
		order: 1;
		with: [ (aBuilder item: #Earley)
				with: [ (aBuilder item: #EarleyBrowser)
						label: 'System Browser';
						action: [ self openBrowserInEarleyEnvironment ];
						icon: Smalltalk tools browser taskbarIcon.
					(aBuilder item: #Workspace)
						label: 'Workspace';
						action: [ Workspace open ].
					(aBuilder item: #EarleyCode)
						label: 'Lines Of Code';
						action: [ JEStats printLinesOfCode ] ] ]
]

{ #category : #environment }
JEEarleyUI class >> openBrowserInEarleyEnvironment [
	^ Smalltalk tools browser open
]
