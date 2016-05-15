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
				package: 'EarleyParser-Tests' with: [ spec requires: #('EarleyParser-Core') ];
				package: 'EarleyUI' with: [ spec requires: #('EarleyParser-Core' 'Roassal2') ];
				package: 'EarleyBNF' with: [ spec requires: #('EarleyParser-Core' 'EarleyParser-Tests') ].
			spec
				group: 'default' with: #('Core' 'Tests' 'Parser' 'UI');
				group: 'Core' with: #('EarleyParser-Core');
				group: 'Tests' with: #('EarleyParser-Tests');
				group: 'Parser' with: #('EarleyBNF');
				group: 'UI' with: #('EarleyUI') ]