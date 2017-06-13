versions
version10: spec
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
