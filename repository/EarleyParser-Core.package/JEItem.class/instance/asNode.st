converting
asNode
	^ JEHypernode
		value:
			(self isFinal
				ifTrue: [ self head ]
				ifFalse: [ self dottedRule ])
		start: startChart number
		end: endChart number