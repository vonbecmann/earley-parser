versions
version100: spec
	<version: '1.0' imports: #('1.0-baseline')>
	spec
		for: #pharo
		do: [ 
			spec blessing: #development.
			spec author: 'BernardoContreras'.
			spec timestamp: '5/10/2012 20:00'.
			spec
				package: 'EarleyParser-Core' with: 'EarleyParser-Core';
				package: 'EarleyParser-Tests' with: 'EarleyParser-Tests' ]