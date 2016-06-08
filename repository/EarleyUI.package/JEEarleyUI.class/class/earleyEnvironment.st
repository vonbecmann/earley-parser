environment
earleyEnvironment
	| packageNames |
	packageNames := OrderedCollection with: ConfigurationOfEarleyParser package packageName.
	packageNames addAll: (ConfigurationOfEarleyParser project development packages collect: [ :each | each name ]).
	^ (RBBrowserEnvironment new forPackageNames: packageNames)
		label: 'Earley Parser Environment';
		yourself