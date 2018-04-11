"
tests for ordered pair.

"
Class {
	#name : #JEOrderedPairTest,
	#superclass : #TestCase,
	#category : 'EarleyParser-Tests-Implementation'
}

{ #category : #tests }
JEOrderedPairTest >> testAsString [
	| one |
	one := JEOrderedPair first: 'A' second: 1.

	self assert: one asString equals: '(''A'', 1)'
]

{ #category : #tests }
JEOrderedPairTest >> testEmpty [
	| one |
	one := JEOrderedPair empty.
	self assert: one first equals: nil.
	self assert: one second equals: nil
]

{ #category : #tests }
JEOrderedPairTest >> testEquality [
	| one another |
	one := JEOrderedPair first: 'A' second: 1.
	another := JEOrderedPair first: 'A' second: 1.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
JEOrderedPairTest >> testEquality01 [
	| one another |
	one := another := JEOrderedPair first: 'A' second: 1.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self assert: one == another
]

{ #category : #tests }
JEOrderedPairTest >> testEquality02 [
	| one another |
	one := JEOrderedPair first: 'A' second: 1.
	another := JEOrderedPair first: 'A' second: 2.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another
]

{ #category : #tests }
JEOrderedPairTest >> testEquality03 [
	| one another |
	one := JEOrderedPair first: 'A' second: 1.
	another := JEOrderedPair first: 'B' second: 1.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another
]

{ #category : #tests }
JEOrderedPairTest >> testFirst [
	| one |
	one := JEOrderedPair first: 'A'.
	self assert: one first equals: 'A'.
	self assert: one second equals: nil
]

{ #category : #tests }
JEOrderedPairTest >> testSecond [
	| one |
	one := JEOrderedPair second: 'A'.
	self assert: one first equals: nil.
	self assert: one second equals: 'A'
]
