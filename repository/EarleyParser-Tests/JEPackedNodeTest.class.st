Class {
	#name : #JEPackedNodeTest,
	#superclass : #TestCase,
	#category : #'EarleyParser-Tests-BSPPForest'
}

{ #category : #tests }
JEPackedNodeTest >> testAddFamilyEmpty [
	| rule first node |
	rule := JERule head: (NCNonterminal named: 'F') body: {}.
	first := JEColumn number: 1.
	node := rule dotAtEnd startedAt: first.

	self assert: node familiesSize equals: 1.
	node addEmptyFamily.
	self assert: node familiesSize equals: 1
]

{ #category : #tests }
JEPackedNodeTest >> testAddFamilyEmpty01 [
	| rule first node |
	rule := JERule head: (NCNonterminal named: 'F') body: {}.
	first := JEColumn number: 1.
	node := rule dotAtEnd startedAt: first.

	self assert: node familiesSize equals: 1.
	node addEmptyFamily.
	node addEmptyFamily.
	node addEmptyFamily.
	self assert: node familiesSize equals: 1
]

{ #category : #tests }
JEPackedNodeTest >> testAddFamilyEmpty02 [
	| rule first node |
	rule := JERule head: (NCNonterminal named: 'F') body: {}.
	first := JEColumn number: 1.
	node := rule dotAtEnd startedAt: first.

	self assert: node familiesSize equals: 1.

]
