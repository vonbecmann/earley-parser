initialization
initializeRegex: aString 
	self initialize.
	regex := aString.
	matcher := aString asRegex 