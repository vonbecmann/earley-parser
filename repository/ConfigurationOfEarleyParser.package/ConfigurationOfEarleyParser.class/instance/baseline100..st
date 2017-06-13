baselines
baseline100: spec
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