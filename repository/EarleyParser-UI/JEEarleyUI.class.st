"
browse earley environment

"
Class {
	#name : 'JEEarleyUI',
	#superclass : 'Object',
	#category : 'EarleyParser-UI',
	#package : 'EarleyParser-UI'
}

{ #category : 'environment' }
JEEarleyUI class >> earleyEnvironment [

	| packages |
	packages := OrderedCollection with: BaselineOfEarleyParser package.
	packages addAll:
		(BaselineOfEarleyParser allPackageNames collect: [ :each |
			 self packageOrganizer packageNamed: each ]).
	^ packages
]

{ #category : 'menu declaring' }
JEEarleyUI class >> earleyToolsOn: aBuilder [

	<worldMenu>
	(aBuilder group: #EarleyTools)
		withSeparatorAfter;
		order: 1;
		with: [
			(aBuilder item: #Earley) with: [
					(aBuilder item: #EarleyBrowser)
						label: 'System Browser';
						action: [ self openBrowserInEarleyEnvironment ];
						icon: (Smalltalk tools browser iconNamed:
									 Smalltalk tools browser taskbarIconName).
					(aBuilder item: #Workspace)
						label: 'Workspace';
						action: [ Smalltalk tools workspace open ].
					(aBuilder item: #EarleyCode)
						label: 'Lines Of Code';
						action: [ JEStats printLinesOfCode ] ] ]
]

{ #category : 'environment' }
JEEarleyUI class >> openBrowserInEarleyEnvironment [
	^ Smalltalk tools browser
		openWithState: [ :browser | browser switchToPackageScopeOf: self earleyEnvironment ]
]
