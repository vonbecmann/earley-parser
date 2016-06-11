accessing
members
	^ members first
		ifNil: [ Array empty ]
		ifNotNil: [ 
			members second
				ifNil: [ Array with: members first ]
				ifNotNil: [ Array with: members first with: members second ] ]