versions
version12: spec
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
