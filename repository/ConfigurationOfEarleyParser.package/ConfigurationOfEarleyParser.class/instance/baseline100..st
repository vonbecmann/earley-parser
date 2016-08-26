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
				project: 'Roassal2'
				with: [ spec
						className: 'ConfigurationOfRoassal2';
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/ObjectProfile/Roassal2/main' ].
			spec
				package: 'EarleyParser-Core'
					with: [ spec requires: #('MultiValuedDictionary') ];
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
				package: 'EarleyForest' 
					with: [ spec requires: #('EarleyParser-Core') ];
				package: 'EarleyForest-UI' 
					with: [ spec requires: #('EarleyForest' 'Roassal2') ];
				package: 'EarleyForest-Tests' 
					with: [ spec requires: #('EarleyForest' 'EarleyParser-Tests') ];
				package: 'EarleyBNF' 
					with: [ spec requires: #('EarleySyntaxTree') ].
			spec
				group: 'default' with: #('Core' 'Tests' 'SyntaxTree' 'Forest' 'Parser' 'UI');
				group: 'Core' with: #('EarleyParser-Core');
				group: 'Tests' with: #('EarleyParser-Tests');
				group: 'SyntaxTree' with: #('EarleySyntaxTree' 'EarleySyntaxTree-UI' 'EarleySyntaxTree-Tests');
				group: 'Forest' with: #('EarleyForest' 'EarleyForest-UI' 'EarleyForest-Tests');
				group: 'Parser' with: #('EarleyBNF');
				group: 'UI' with: #('EarleyParser-UI') ]