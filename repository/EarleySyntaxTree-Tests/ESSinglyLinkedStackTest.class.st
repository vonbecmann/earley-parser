Class {
	#name : #ESSinglyLinkedStackTest,
	#superclass : #TestCase,
	#category : #'EarleySyntaxTree-Tests-Implementation'
}

{ #category : #tests }
ESSinglyLinkedStackTest >> testPopReversed [
	| stack reversed |
	stack := SinglyLinkedStack new.
	stack
		push: 1;
		push: 2;
		push: 3;
		push: 4;
		push: 5.
	reversed := stack popReversed: 3.
	self assert: reversed size equals: 3.
	self assert: reversed equals: #(3 4 5).
	self assert: stack size equals: 2
]

{ #category : #tests }
ESSinglyLinkedStackTest >> testPopReversed02 [
	| stack |
	stack := SinglyLinkedStack new.
	stack
		push: 1;
		push: 2.
	self should: [ stack popReversed: 3 ] raise: Error
]

{ #category : #tests }
ESSinglyLinkedStackTest >> testPopReversed03 [
	| stack reversed |
	stack := SinglyLinkedStack new.
	stack
		push: 1;
		push: 2;
		push: 3;
		push: 4;
		push: 5.
	reversed := stack popReversed: 0.
	self assert: reversed size equals: 0.
	self assert: reversed equals: #().
	self assert: stack size equals: 5
]
