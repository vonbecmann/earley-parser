environment
openBrowserInEarleyEnvironment
	^ (Smalltalk tools browser browsedEnvironment: self earleyEnvironment)
		open