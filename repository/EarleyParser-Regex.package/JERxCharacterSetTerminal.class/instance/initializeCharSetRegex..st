initialization
initializeCharSetRegex: aCharSetRegexString 
	self initialize.
	charSetRegex := aCharSetRegexString.
	matcher := aCharSetRegexString asRegex 