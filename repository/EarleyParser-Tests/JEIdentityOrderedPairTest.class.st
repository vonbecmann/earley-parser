"
tests for identity ordered pair.

"
Class {
	#name : #JEIdentityOrderedPairTest,
	#superclass : #TestCase,
	#category : 'EarleyParser-Tests-Implementation'
}

{ #category : #tests }
JEIdentityOrderedPairTest >> testAsString [
	| one |
	one := JEIdentityOrderedPair first: 'A' second: 1.

	self assert: one asString equals: '<''A'', 1>'
]

{ #category : #tests }
JEIdentityOrderedPairTest >> testEmpty [
	| one |
	one := JEIdentityOrderedPair empty.
	self assert: one first equals: nil.
	self assert: one second equals: nil
]

{ #category : #tests }
JEIdentityOrderedPairTest >> testEquality [
	| one another |
	one := JEIdentityOrderedPair first: 'A' second: 1.
	another := JEIdentityOrderedPair first: 'A' second: 1.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
JEIdentityOrderedPairTest >> testEquality01 [
	| one another |
	one := another := JEIdentityOrderedPair first: 'A' second: 1.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self assert: one == another
]

{ #category : #tests }
JEIdentityOrderedPairTest >> testEquality02 [
	| one another |
	one := JEIdentityOrderedPair first: 'A' second: 1.
	another := JEIdentityOrderedPair first: 'A' second: 2.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another
]

{ #category : #tests }
JEIdentityOrderedPairTest >> testEquality03 [
	| one another |
	one := JEIdentityOrderedPair first: 'A' second: 1.
	another := JEIdentityOrderedPair first: 'B' second: 1.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another
]

{ #category : #tests }
JEIdentityOrderedPairTest >> testFirst [
	| one |
	one := JEIdentityOrderedPair first: 'A'.
	self assert: one first equals: 'A'.
	self assert: one second equals: nil
]

{ #category : #tests }
JEIdentityOrderedPairTest >> testSecond [
	| one |
	one := JEIdentityOrderedPair second: 'A'.
	self assert: one first equals: nil.
	self assert: one second equals: 'A'
]
