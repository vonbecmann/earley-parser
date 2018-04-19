"
test for a family of packed nodes.

"
Class {
	#name : #JEFamilyTest,
	#superclass : #TestCase,
	#instVars : [
		'parentNode',
		'firstPackedNode',
		'secondPackedNode'
	],
	#category : 'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEFamilyTest >> setUp [
	parentNode := ((JERule 
							head: (JENonterminal named: 'C') 
							body: {(JENonterminal named: 'A'). (JENonterminal named: 'B')}) dotAtEnd
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 3)) node.
	firstPackedNode := ((JERule head: (JENonterminal named: 'A') body: {}) dotAtEnd
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 2)) node.
	secondPackedNode := ((JERule head: (JENonterminal named: 'B') body: {}) dotAtEnd
		startedAt: (JEColumn number: 2)
		andEndedAt: (JEColumn number: 3)) node
]

{ #category : #tests }
JEFamilyTest >> testAsStringEmptyFamily [
	self assert: JEFamily empty asString equals: '()'
]

{ #category : #tests }
JEFamilyTest >> testAsStringFamilyWithOneChild [
	self assert: (JEFamily with: firstPackedNode) asString equals: '(([A: ·. @ [1, 2]]))'
]

{ #category : #tests }
JEFamilyTest >> testAsStringFamilyWithTwoChildren [
	self
		assert: (JEFamily with: firstPackedNode with: secondPackedNode) asString
		equals: '(([A: ·. @ [1, 2]]), ([B: ·. @ [2, 3]]))'
]

{ #category : #tests }
JEFamilyTest >> testEqualsEmptyFamily [
	| one another |
	one := JEFamily empty.
	another := JEFamily empty.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
JEFamilyTest >> testEqualsEmptyFamilyWithDifferentParent [
	| one another |
	one := JEFamily empty.
	one parent: parentNode.
	
	another := JEFamily empty.

	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another
]

{ #category : #tests }
JEFamilyTest >> testEqualsEmptyFamilyWithSameParent [
	| one another |
	one := JEFamily empty.
	one parent: parentNode.
	
	another := JEFamily empty.
	another parent: parentNode.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
JEFamilyTest >> testEqualsFamilyWithOneChild [
	| one another |
	one := JEFamily with: firstPackedNode.
	another := JEFamily with: firstPackedNode.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
JEFamilyTest >> testEqualsFamilyWithOneChildAndDifferentParent [
	| one another |
	one := JEFamily with: firstPackedNode.
	one parent: parentNode.
	
	another := JEFamily with: firstPackedNode.


	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another
]

{ #category : #tests }
JEFamilyTest >> testEqualsFamilyWithOneChildAndSameParent [
	| one another |
	one := JEFamily with: firstPackedNode.
	one parent: parentNode.
	
	another := JEFamily with: firstPackedNode.
	another parent: parentNode.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
JEFamilyTest >> testEqualsFamilyWithTwoChildren [
	| one another |
	one := JEFamily with: firstPackedNode with: secondPackedNode.
	another := JEFamily with: firstPackedNode with: secondPackedNode.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
JEFamilyTest >> testEqualsFamilyWithTwoChildrenAndDifferentParent [
	| one another |
	one := JEFamily with: firstPackedNode with: secondPackedNode.
	one parent: parentNode.
	
	another := JEFamily with: firstPackedNode with: secondPackedNode.

	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another
]

{ #category : #tests }
JEFamilyTest >> testEqualsFamilyWithTwoChildrenAndSameParent [
	| one another |
	one := JEFamily with: firstPackedNode with: secondPackedNode.
	one parent: parentNode.
	
	another := JEFamily with: firstPackedNode with: secondPackedNode.
	another parent: parentNode.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
JEFamilyTest >> testIsEmptyWhenFamilyIsEmpty [
	self assert: JEFamily empty isEmpty
]

{ #category : #tests }
JEFamilyTest >> testIsEmptyWhenFamilyWithOneChild [
	self deny: (JEFamily with: firstPackedNode) isEmpty
]

{ #category : #tests }
JEFamilyTest >> testIsEmptyWhenFamilyWithTwoChildren [
	self deny: (JEFamily with: firstPackedNode with: secondPackedNode) isEmpty
]