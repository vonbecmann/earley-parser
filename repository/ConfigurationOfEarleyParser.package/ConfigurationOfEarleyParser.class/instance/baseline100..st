baselines
baseline100: spec
	<version: '1.0-baseline'>
	spec
		for: #pharo
		do: [ spec blessing: #baseline.
			spec repository: 'http://smalltalkhub.com/mc/vonbecmann/earley-parser/main'.
			spec
				project: 'Roassal2'
				with: [ spec
						className: 'ConfigurationOfRoassal2';
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/ObjectProfile/Roassal2/main' ].
			spec
				package: 'EarleyParser-Core';
				package: 'EarleyParser-Forest' 
					with: [ spec requires: #('EarleyParser-Core') ];
				package: 'EarleyParser-Tests' 
					with: [ spec requires: #('EarleyParser-Core' 'EarleyParser-Forest') ];
				package: 'EarleyParser-Forest-Tests' 
					with: [ spec requires: #('EarleyParser-Forest' 'EarleyParser-Tests') ];
				package: 'EarleyUI' 
					with: [ spec requires: #('EarleyParser-Core' 'EarleyParser-Forest' 'Roassal2') ];
				package: 'EarleyBNF' 
					with: [ spec requires: #('EarleyParser-Core' 
													'EarleyParser-Forest'
													'EarleyParser-Tests') ].
			spec
				group: 'default' with: #('Core' 'Forest' 'Tests' 'Parser' 'UI');
				group: 'Core' with: #('EarleyParser-Core');
				group: 'Forest' with: #('EarleyParser-Forest' 'EarleyParser-Forest-Tests');
				group: 'Tests' with: #('EarleyParser-Tests');
				group: 'Parser' with: #('EarleyBNF');
				group: 'UI' with: #('EarleyUI') ]