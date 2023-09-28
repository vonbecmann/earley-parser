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
	#category : #'EarleyParser-Tests-BSPPForest'
}

{ #category : #running }
JEFamilyTest >> setUp [
	super setUp.
	parentNode := ((JERule
							head: (NCNonterminal named: 'C')
							body: {(NCNonterminal named: 'A'). (NCNonterminal named: 'B')}) dotAtEnd
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 3)).
	firstPackedNode := ((JERule head: (NCNonterminal named: 'A') body: {}) dotAtEnd
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 2)).
	secondPackedNode := ((JERule head: (NCNonterminal named: 'B') body: {}) dotAtEnd
		startedAt: (JEColumn number: 2)
		andEndedAt: (JEColumn number: 3))
]

{ #category : #tests }
JEFamilyTest >> testAsStringEmptyFamily [
	self assert: (JEFamily emptyWithParent: nil) asString equals: '()'
]

{ #category : #tests }
JEFamilyTest >> testAsStringFamilyWithOneMember [
	self assert: (JEFamily parent: nil first: firstPackedNode) asString equals: '([A: ·. @ [1, 2]])'
]

{ #category : #tests }
JEFamilyTest >> testAsStringFamilyWithTwoMembers [
	self
		assert: (JEFamily parent: nil first: firstPackedNode second: secondPackedNode) asString
		equals: '([A: ·. @ [1, 2]], [B: ·. @ [2, 3]])'
]

{ #category : #tests }
JEFamilyTest >> testEqualsEmptyFamily [
	| one another |
	one := JEFamily emptyWithParent: nil.
	another := JEFamily emptyWithParent: nil.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
JEFamilyTest >> testEqualsEmptyFamilyWithDifferentParent [
	| one another |
	one := JEFamily emptyWithParent: parentNode.
	another := JEFamily emptyWithParent: nil.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
JEFamilyTest >> testEqualsEmptyFamilyWithSameParent [
	| one another |
	one := JEFamily emptyWithParent: parentNode.
	another := JEFamily emptyWithParent: parentNode.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
JEFamilyTest >> testEqualsFamilyWithOneMember [
	| one another |
	one := JEFamily parent: nil first: firstPackedNode.
	another := JEFamily parent: nil first: firstPackedNode.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
JEFamilyTest >> testEqualsFamilyWithOneMemberAndDifferentParent [
	| one another |
	one := JEFamily parent: parentNode first: firstPackedNode.
	another := JEFamily parent: nil first: firstPackedNode.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
JEFamilyTest >> testEqualsFamilyWithOneMemberAndSameParent [
	| one another |
	one := JEFamily parent: parentNode first: firstPackedNode.
	another := JEFamily parent: parentNode first: firstPackedNode.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
JEFamilyTest >> testEqualsFamilyWithTwoMembers [
	| one another |
	one := JEFamily
		parent: nil
		first: firstPackedNode
		second: secondPackedNode.
	another := JEFamily
		parent: nil
		first: firstPackedNode
		second: secondPackedNode.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
JEFamilyTest >> testEqualsFamilyWithTwoMembersAndDifferentParent [
	| one another |
	one := JEFamily
		parent: parentNode
		first: firstPackedNode
		second: secondPackedNode.
	another := JEFamily
		parent: nil
		first: firstPackedNode
		second: secondPackedNode.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
JEFamilyTest >> testEqualsFamilyWithTwoMembersAndSameParent [
	| one another |
	one := JEFamily
		parent: parentNode
		first: firstPackedNode
		second: secondPackedNode.
	another := JEFamily
		parent: parentNode
		first: firstPackedNode
		second: secondPackedNode.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
JEFamilyTest >> testIsEmptyWhenFamilyIsEmpty [
	self assert: (JEFamily emptyWithParent: nil) isEmpty
]

{ #category : #tests }
JEFamilyTest >> testIsEmptyWhenFamilyWithOneMember [
	self deny: (JEFamily parent: nil first: firstPackedNode) isEmpty
]

{ #category : #tests }
JEFamilyTest >> testIsEmptyWhenFamilyWithTwoMembers [
	self deny: (JEFamily parent: nil first: firstPackedNode second: secondPackedNode) isEmpty
]
