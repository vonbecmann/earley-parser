comparing
= aSymbol
	self class == aSymbol class
		ifFalse: [ ^ false ].
	symbol = aSymbol symbol
		ifFalse: [ ^ false ].
	^ true