"
baseline of Earley Parser

"
Class {
	#name : #BaselineOfEarleyParser,
	#superclass : #BaselineOf,
	#category : 'BaselineOfEarleyParser'
}

{ #category : #baselines }
BaselineOfEarleyParser >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
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
				package: 'EarleyAnalyzer' 
					with: [ spec requires: #('EarleyParser-Tests') ];
				package: 'EarleySyntaxTree' 
					with: [ spec requires: #('EarleyParser-Core') ];
				package: 'EarleySyntaxTree-UI' 
					with: [ spec requires: #('EarleySyntaxTree' 'Roassal2') ];
				package: 'EarleySyntaxTree-Tests' 
					with: [ spec requires: #('EarleySyntaxTree') ];
				package: 'Earley1VW' 
					with: [ spec requires: #('EarleySyntaxTree') ];
				package: 'EarleyVW' 
					with: [ spec requires: #('Earley1VW') ].
			spec
				group: 'default' 
				with: #('Core' 'Tests' 'Regex' 'Analyzer' 'SyntaxTree' 'Parser' 'VWParser' 'UI');
				group: 'Core' with: #('EarleyParser-Core');
				group: 'Regex' with: #('EarleyParser-Regex');
				group: 'Analyzer' with: #('EarleyAnalyzer');
				group: 'Tests' with: #('EarleyParser-Tests' 'EarleySyntaxTree-Tests');
				group: 'SyntaxTree' with: #('EarleySyntaxTree');
				group: 'Parser' with: #('Earley1VW');
				group: 'VWParser' with: #('EarleyVW');				
				group: 'UI' with: #('EarleyParser-UI' 'EarleySyntaxTree-UI') ]
]
