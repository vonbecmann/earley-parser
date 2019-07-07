"
baseline of Earley Parser

"
Class {
	#name : #BaselineOfEarleyParser,
	#superclass : #BaselineOf,
	#category : #BaselineOfEarleyParser
}

{ #category : #baselines }
BaselineOfEarleyParser >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec
	        	baseline: 'MultiValuedDictionary'
 		   		with: [ spec repository: 'github://vonbecmann/multi-valued-dictionary/repository' ].
			spec
	        	baseline: 'LinkedList'
 		   		with: [ spec repository: 'github://vonbecmann/linked-list/repository' ].
			spec
				project: 'Roassal2'
				with: [ spec
						className: 'ConfigurationOfRoassal2';
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/ObjectProfile/Roassal2/main' ].
			spec
				package: 'NoamChomsky-Core';
				package: 'NoamChomsky-Regex' 
					with: [ spec requires: #('NoamChomsky-Core') ];
				package: 'NoamChomsky-Tests'
					with: [ spec requires: #('NoamChomsky-Core') ];

				package: 'EarleyParser-Core'
					with: [ spec requires: #('NoamChomsky-Core' 'MultiValuedDictionary' 'LinkedList') ];
				package: 'EarleyParser-InspectorExtensions'
					with: [ spec requires: #('EarleyParser-Core') ];
				package: 'EarleyParser-UI' 
					with: [ spec requires: #('EarleyParser-Core' 'Roassal2') ];
				package: 'EarleyParser-Tests' 
					with: [ spec requires: #('EarleyParser-Core') ];
				package: 'EarleyAnalyzer' 
					with: [ spec requires: #('EarleyParser-Tests') ];
				package: 'EarleySyntaxTree' 
					with: [ spec requires: #('EarleyParser-Core') ];
				package: 'EarleySyntaxTree-InspectorExtensions'
					with: [ spec requires: #('EarleySyntaxTree') ];
				package: 'EarleySyntaxTree-UI' 
					with: [ spec requires: #('EarleySyntaxTree' 'Roassal2') ];
				package: 'EarleySyntaxTree-Tests' 
					with: [ spec requires: #('EarleySyntaxTree') ];
				package: 'Earley1VW' 
					with: [ spec requires: #('EarleySyntaxTree') ];
				package: 'Earley1VW-Tests' 
					with: [ spec requires: #('Earley1VW') ].
			spec
				group: 'default' 
					with: #('Core' 'Tests' 'Regex' 'Analyzer' 'SyntaxTree' 'Parser' 'UI');
				group: 'Core' 
					with: #('NoamChomsky-Core' 'EarleyParser-Core' 'EarleyParser-InspectorExtensions');
				group: 'Regex' with: #('NoamChomsky-Regex');
				group: 'Analyzer' with: #('EarleyAnalyzer');
				group: 'Tests' 
					with: #(	'NoamChomsky-Tests' 'EarleyParser-Tests'
								'EarleySyntaxTree-Tests' 'Earley1VW-Tests');
				group: 'SyntaxTree' with: #('EarleySyntaxTree' 'EarleySyntaxTree-InspectorExtensions');
				group: 'Parser' with: #('Earley1VW' 'Core' 'SyntaxTree');
				group: 'UI' with: #('EarleyParser-UI' 'EarleySyntaxTree-UI') ]
]
