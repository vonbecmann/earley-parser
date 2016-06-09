testing
isAmbiguous
	| visited queue |
	visited := IdentityDictionary new.
	queue := JELinkedList with: root.
	visited at: root put: true.
	[ queue isEmpty ]
		whileFalse: [ | packed |
			packed := queue removeFirst.
			packed familiesSize > 1
				ifTrue: [ ^ true ].
			packed families
				do: [ :family | 
					family members
						reject: [ :node | visited at: node ifAbsent: [ false ] ]
						thenDo: [ :node | 
							visited at: node put: true.
							queue addLast: node ] ] ].
	^ false