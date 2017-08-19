environment
earleyEnvironment
	| packageNames |
	packageNames := OrderedCollection with: BaselineOfEarleyParser package packageName.
	packageNames addAll: (BaselineOfEarleyParser project version packages collect: [ :each | each name ]).
	^ (RBBrowserEnvironment new forPackageNames: packageNames)
		label: 'Earley Parser Environment';
		yourself