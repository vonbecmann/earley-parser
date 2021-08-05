"
i am signaled when a chart is empty or the last chart doesn't include the final item. 
that means that something went wrong during the processing of the input sentence.


expected symbols - terminals or nonterminals expected next in the input sentence.

"
Class {
	#name : #JEFailure,
	#superclass : #Error,
	#instVars : [
		'expectedSymbols'
	],
	#category : #'EarleyParser-Core-Implementation'
}

{ #category : #accessing }
JEFailure class >> failedAt: column got: anObject [
	" failed at the given column because it got an object that it isn't one of the expected symbols. "

	^ JEFailureAtPosition new
		expectedSymbols: column expectedSymbols;
		position: column number;
		actual: anObject;
		signal
]

{ #category : #accessing }
JEFailure class >> failedAtLast: column [
	" failed at last column. the position is not relevant and there is no actual object because we are at the end "

	^ JEFailureAtEnd new
		expectedSymbols: column expectedSymbols;
		signal
]

{ #category : #accessing }
JEFailure >> expectedSymbols [
	"expected symbols (terminals or nonterminals)"

	^ expectedSymbols
]

{ #category : #initialization }
JEFailure >> expectedSymbols: aSymbolCollection [
	expectedSymbols := aSymbolCollection
]

{ #category : #accessing }
JEFailure >> wasAtEnd [
	" 
	- true if it failed at the end of the input sentence.
	- false if it failed in the middle of the input sentence.
	"

	self subclassResponsibility
]
