comparing
= anItem
	self == anItem
		ifTrue: [ ^ true ].
	self class == anItem class
		ifFalse: [ ^ false ].
	start = anItem start
		ifFalse: [ ^ false ].
	dottedRule = anItem dottedRule
		ifFalse: [ ^ false ].
	end = anItem end
		ifFalse: [ ^ false ].
	^ true