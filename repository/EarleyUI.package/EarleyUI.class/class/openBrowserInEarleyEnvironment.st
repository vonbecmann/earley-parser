menu declaring
openBrowserInEarleyEnvironment
	^ (Smalltalk tools browser browsedEnvironment: self earleyEnvironment)
		open