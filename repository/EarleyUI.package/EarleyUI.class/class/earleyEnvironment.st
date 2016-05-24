environment
earleyEnvironment
	| packageNames |
	packageNames := ConfigurationOfEarleyParser project development packages collect: [ :each | each name ].
	^ RBBrowserEnvironment new forPackageNames: packageNames