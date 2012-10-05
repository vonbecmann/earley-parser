baselines
baseline100: spec
	<version: '1.0-baseline'>
	spec
		for: #pharo
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://ss3.gemstone.com/ss/crappy-code'.
			spec
				package: 'EarleyParser-Core';
				package: 'EarleyParser-Tests' with: [ spec requires: 'EarleyParser-Core' ].
			spec
				group: 'default' with: #('Core');
				group: 'Core' with: #('EarleyParser-Core');
				group: 'Tests' with: #('EarleyParser-Tests') ]