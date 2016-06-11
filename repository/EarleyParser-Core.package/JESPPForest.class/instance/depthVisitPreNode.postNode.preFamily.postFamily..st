public
depthVisitPreNode: preNodeBlock postNode: postNodeBlock preFamily: preFamilyBlock postFamily: postFamilyBlock
	| visitStack visited |
	visited := IdentityDictionary new.
	visitStack := JEStack with: root.
	[ visitStack isEmpty ]
		whileFalse: [ | element |
			element := visitStack top.
			(visited at: element ifAbsent: [ false ])
				ifTrue: [ 
					visitStack pop.
					(postNodeBlock isNotNil and: [ element class == JEPackedNode ]) ifTrue: [ postNodeBlock value: element ].
					(preFamilyBlock isNotNil and: [ element class == JEFamily ]) ifTrue: [ preFamilyBlock value: element ] ]
				ifFalse: [ 
					visited at: element put: true.
					element class == JEPackedNode
						ifTrue: [ 
							preNodeBlock ifNotNil: [ preNodeBlock value: element ].
							element families do: [ :edge | visitStack push: edge ] ].
					element class == JEFamily
						ifTrue: [ 
							postFamilyBlock ifNotNil: [ postFamilyBlock value: element ].
							element members
								reverseDo: [ :node | (visited at: node ifAbsentPut: [ false ]) ifFalse: [ visitStack push: node ] ] ] ] ]