enumerating
reject: rejectBlock thenDo: aBlock
	"Utility method to improve readability."

	self
		do: [ :each | 
			(rejectBlock value: each)
				ifFalse: [ aBlock value: each ] ]