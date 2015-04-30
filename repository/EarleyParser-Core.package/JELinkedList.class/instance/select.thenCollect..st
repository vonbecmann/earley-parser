enumerating
select: selectBlock thenCollect: collectBlock
	"Utility method to improve readability."

	| newCollection |
	newCollection := self class new.
	self
		do: [ :each | 
			(selectBlock value: each)
				ifTrue: [ newCollection add: (collectBlock value: each) ] ].
	^ newCollection