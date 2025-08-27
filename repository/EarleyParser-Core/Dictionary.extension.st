Extension { #name : 'Dictionary' }

{ #category : '*EarleyParser-Core' }
Dictionary >> jeAt: firstKey at: secondKey ifAbsentPut: absentBlock [
	| index |
	index := self findElementOrNil: firstKey.
	^ (array at: index)
		ifNil: [ | anObject |
			anObject := absentBlock value.
			self
				atNewIndex: index
				put:
					(Association basicNew
						key: firstKey
						value:
							(self class new
								jeAt: secondKey put: anObject;
								yourself)).
			anObject ]
		ifNotNil: [:assoc | assoc value jeAt: secondKey ifAbsentPut: absentBlock ]
]

{ #category : '*EarleyParser-Core' }
Dictionary >> jeAt: firstKey at: secondKey ifPresent: aPresentBlock ifAbsent: absentBlock [
	^ (array at: (self findElementOrNil: firstKey))
		ifNil: [ absentBlock value ]
		ifNotNil: [ :assoc |
							assoc value jeAt: secondKey ifPresent: aPresentBlock ifAbsent: absentBlock ]
]

{ #category : '*EarleyParser-Core' }
Dictionary >> jeAt: key ifAbsentPut: absentBlock [
	"
	Return the value at the given key.
	If key is not included in the receiver store the result
	of evaluating aBlock as new value.
	"

	| index |
	index := self findElementOrNil: key.
	^ ((array at: index)
		ifNil: [ | newAssoc |
			newAssoc := Association basicNew key: key value: absentBlock value.
			self atNewIndex: index put: newAssoc.
			newAssoc ]
		ifNotNil: [ :assoc | assoc ]) value
]

{ #category : '*EarleyParser-Core' }
Dictionary >> jeAt: key ifPresent: aPresentBlock ifAbsent: absentBlock [
	^ (array at: (self findElementOrNil: key))
		ifNil: [ absentBlock value ]
		ifNotNil: [ :assoc | aPresentBlock cull: assoc value ]
]

{ #category : '*EarleyParser-Core' }
Dictionary >> jeAt: key ifPresent: aPresentBlock ifAbsentPut: absentBlock [
	"
	Return the value at the given key.
	If key is not included in the receiver store the result
	of evaluating aBlock as new value.
	"

	| index |
	index := self findElementOrNil: key.
	^ (array at: index)
		ifNil: [ | anObject |
			anObject := absentBlock value.
			self atNewIndex: index put: (Association basicNew key: key value: anObject).
			anObject ]
		ifNotNil: [ :assoc | aPresentBlock cull: assoc value ]
]

{ #category : '*EarleyParser-Core' }
Dictionary >> jeAt: key put: anObject [
	"Set the value at key to be anObject.  If key is not found, create a
	new entry for key and set is value to anObject. Answer anObject."

	| index |
	index := self findElementOrNil: key.
	(array at: index)
		ifNil: [ self atNewIndex: index put: (Association basicNew key: key value: anObject) ]
		ifNotNil: [ :assoc | assoc value: anObject ].
	^ anObject
]
