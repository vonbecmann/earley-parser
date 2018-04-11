"
ConfigurationOfEarleyParser loadDevelopment.

or 

Metacello new
	  smalltalkhubUser: 'vonbecmann' project: 'earley-parser';
	  configuration: 'EarleyParser';
	  version: #development;
	  load.
"
Class {
	#name : #ConfigurationOfEarleyParser,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfEarleyParser'
}

{ #category : #'development support' }
ConfigurationOfEarleyParser class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfEarleyParser class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfEarleyParser class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfEarleyParser class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfEarleyParser class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfEarleyParser class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfEarleyParser class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfEarleyParser class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfEarleyParser class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfEarleyParser class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfEarleyParser >> baseline100: spec [
	<version: '1.0-baseline'>
	spec
		for: #pharo
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://smalltalkhub.com/mc/vonbecmann/earley-parser/main'.
			spec
	        	baseline: 'MultiValuedDictionary'
 		   		with: [ spec repository: 'github://vonbecmann/multi-valued-dictionary:pharo5/repository' ].
			spec
	        	baseline: 'LinkedList'
 		   		with: [ spec repository: 'github://vonbecmann/linked-list:pharo5/repository' ].
			spec
				project: 'Roassal2'
				with: [ spec
						className: 'ConfigurationOfRoassal2';
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/ObjectProfile/Roassal2/main' ].
			spec
				package: 'EarleyParser-Core'
					with: [ spec requires: #('MultiValuedDictionary' 'LinkedList') ];
				package: 'EarleyParser-Regex' 
					with: [ spec requires: #('EarleyParser-Core') ];
				package: 'EarleyParser-UI' 
					with: [ spec requires: #('EarleyParser-Core' 'Roassal2') ];
				package: 'EarleyParser-Tests' 
					with: [ spec requires: #('EarleyParser-Core') ];
				package: 'EarleySyntaxTree' 
					with: [ spec requires: #('EarleyParser-Core') ];
				package: 'EarleySyntaxTree-UI' 
					with: [ spec requires: #('EarleySyntaxTree' 'Roassal2') ];
				package: 'EarleySyntaxTree-Tests' 
					with: [ spec requires: #('EarleySyntaxTree') ];
				package: 'Earley1VW' 
					with: [ spec requires: #('EarleySyntaxTree') ].
			spec
				group: 'default' with: #('Core' 'Tests' 'Regex' 'SyntaxTree' 'Parser' 'UI');
				group: 'Core' with: #('EarleyParser-Core');
				group: 'Regex' with: #('EarleyParser-Regex');
				group: 'Tests' with: #('EarleyParser-Tests' 'EarleySyntaxTree-Tests');
				group: 'SyntaxTree' with: #('EarleySyntaxTree');
				group: 'Parser' with: #('Earley1VW');
				group: 'UI' with: #('EarleyParser-UI' 'EarleySyntaxTree-UI') ]
]

{ #category : #baselines }
ConfigurationOfEarleyParser >> baseline13: spec [
	<version: '1.3-baseline'>
	spec
		for: #pharo
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://smalltalkhub.com/mc/vonbecmann/earley-parser/main'.
			spec
	        	baseline: 'MultiValuedDictionary'
 		   		with: [ spec repository: 'github://vonbecmann/multi-valued-dictionary:pharo6/repository' ].
			spec
	        	baseline: 'LinkedList'
 		   		with: [ spec repository: 'github://vonbecmann/linked-list:pharo6/repository' ].
			spec
				project: 'Roassal2'
				with: [ spec
						className: 'ConfigurationOfRoassal2';
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/ObjectProfile/Roassal2/main' ].
			spec
				package: 'EarleyParser-Core'
					with: [ spec requires: #('MultiValuedDictionary' 'LinkedList') ];
				package: 'EarleyParser-Regex' 
					with: [ spec requires: #('EarleyParser-Core') ];
				package: 'EarleyParser-UI' 
					with: [ spec requires: #('EarleyParser-Core' 'Roassal2') ];
				package: 'EarleyParser-Tests' 
					with: [ spec requires: #('EarleyParser-Core') ];
				package: 'EarleySyntaxTree' 
					with: [ spec requires: #('EarleyParser-Core') ];
				package: 'EarleySyntaxTree-UI' 
					with: [ spec requires: #('EarleySyntaxTree' 'Roassal2') ];
				package: 'EarleySyntaxTree-Tests' 
					with: [ spec requires: #('EarleySyntaxTree') ];
				package: 'Earley1VW' 
					with: [ spec requires: #('EarleySyntaxTree') ].
			spec
				group: 'default' with: #('Core' 'Tests' 'Regex' 'SyntaxTree' 'Parser' 'UI');
				group: 'Core' with: #('EarleyParser-Core');
				group: 'Regex' with: #('EarleyParser-Regex');
				group: 'Tests' with: #('EarleyParser-Tests' 'EarleySyntaxTree-Tests');
				group: 'SyntaxTree' with: #('EarleySyntaxTree');
				group: 'Parser' with: #('Earley1VW');
				group: 'UI' with: #('EarleyParser-UI' 'EarleySyntaxTree-UI') ]
]

{ #category : #accessing }
ConfigurationOfEarleyParser >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #'symbolic versions' }
ConfigurationOfEarleyParser >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '1.3-baseline'.

	spec for: #'pharo' version: '1.3-baseline'.

]

{ #category : #accessing }
ConfigurationOfEarleyParser >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfEarleyParser >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '1.21'.

]

{ #category : #versions }
ConfigurationOfEarleyParser >> version10: spec [
	<version: '1.0' imports: #('1.0-baseline' )>

	spec for: #'pharo' do: [
		spec blessing: #'baseline'.
		spec 
			baseline: 'MultiValuedDictionary' ;
			baseline: 'LinkedList' ;
			project: 'Roassal2' with: '1.47'.
		spec 
			package: 'EarleyParser-Core' with: 'EarleyParser-Core-BernardoContreras.629';
			package: 'EarleyParser-Regex' with: 'EarleyParser-Regex-BernardoContreras.1';
			package: 'EarleyParser-UI' with: 'EarleyParser-UI-BernardoContreras.27';
			package: 'EarleyParser-Tests' with: 'EarleyParser-Tests-BernardoContreras.349';
			package: 'EarleySyntaxTree' with: 'EarleySyntaxTree-BernardoContreras.34';
			package: 'EarleySyntaxTree-UI' with: 'EarleySyntaxTree-UI-BernardoContreras.9';
			package: 'EarleySyntaxTree-Tests' with: 'EarleySyntaxTree-Tests-BernardoContreras.15';
			package: 'Earley1VW' with: 'Earley1VW-BernardoContreras.6'. ].

]

{ #category : #versions }
ConfigurationOfEarleyParser >> version11: spec [
	<version: '1.1' imports: #('1.0-baseline' )>

	spec for: #'pharo' do: [
		spec blessing: #'baseline'.
		spec 
			baseline: 'MultiValuedDictionary' ;
			baseline: 'LinkedList' ;
			project: 'Roassal2' with: '1.47'.
		spec 
			package: 'EarleyParser-Core' with: 'EarleyParser-Core-BernardoContreras.630';
			package: 'EarleyParser-Regex' with: 'EarleyParser-Regex-BernardoContreras.1';
			package: 'EarleyParser-UI' with: 'EarleyParser-UI-BernardoContreras.27';
			package: 'EarleyParser-Tests' with: 'EarleyParser-Tests-BernardoContreras.350';
			package: 'EarleySyntaxTree' with: 'EarleySyntaxTree-BernardoContreras.34';
			package: 'EarleySyntaxTree-UI' with: 'EarleySyntaxTree-UI-BernardoContreras.9';
			package: 'EarleySyntaxTree-Tests' with: 'EarleySyntaxTree-Tests-BernardoContreras.15';
			package: 'Earley1VW' with: 'Earley1VW-BernardoContreras.6'. ].

]

{ #category : #versions }
ConfigurationOfEarleyParser >> version121: spec [
	<version: '1.21' imports: #('1.0-baseline' )>

	spec for: #'pharo' do: [
		spec blessing: #'baseline'.
		spec 
			baseline: 'MultiValuedDictionary' ;
			baseline: 'LinkedList' ;
			project: 'Roassal2' with: '1.49'.
		spec 
			package: 'EarleyParser-Core' with: 'EarleyParser-Core-BernardoContreras.638';
			package: 'EarleyParser-Regex' with: 'EarleyParser-Regex-BernardoContreras.1';
			package: 'EarleyParser-UI' with: 'EarleyParser-UI-BernardoContreras.34';
			package: 'EarleyParser-Tests' with: 'EarleyParser-Tests-BernardoContreras.352';
			package: 'EarleySyntaxTree' with: 'EarleySyntaxTree-BernardoContreras.37';
			package: 'EarleySyntaxTree-UI' with: 'EarleySyntaxTree-UI-BernardoContreras.10';
			package: 'EarleySyntaxTree-Tests' with: 'EarleySyntaxTree-Tests-BernardoContreras.15';
			package: 'Earley1VW' with: 'Earley1VW-BernardoContreras.8'. ].

]

{ #category : #versions }
ConfigurationOfEarleyParser >> version12: spec [
	<version: '1.2' imports: #('1.0-baseline' )>

	spec for: #'pharo' do: [
		spec blessing: #'baseline'.
		spec 
			baseline: 'MultiValuedDictionary' ;
			baseline: 'LinkedList' ;
			project: 'Roassal2' with: '1.49'.
		spec 
			package: 'EarleyParser-Core' with: 'EarleyParser-Core-BernardoContreras.634';
			package: 'EarleyParser-Regex' with: 'EarleyParser-Regex-BernardoContreras.1';
			package: 'EarleyParser-UI' with: 'EarleyParser-UI-BernardoContreras.28';
			package: 'EarleyParser-Tests' with: 'EarleyParser-Tests-BernardoContreras.351';
			package: 'EarleySyntaxTree' with: 'EarleySyntaxTree-BernardoContreras.37';
			package: 'EarleySyntaxTree-UI' with: 'EarleySyntaxTree-UI-BernardoContreras.10';
			package: 'EarleySyntaxTree-Tests' with: 'EarleySyntaxTree-Tests-BernardoContreras.15';
			package: 'Earley1VW' with: 'Earley1VW-BernardoContreras.8'. ].

]
