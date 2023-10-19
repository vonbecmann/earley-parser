"
a syntax node 

symbol : a terminal or nonterminal
reason : there is a reason to claim this symbol
	- a rule that defines this nonterminal node and has been provided by the user.
	-  a word from the input that matches the terminal.
start : the start position where this node starts
end : the end position where this node ends 

"
Class {
	#name : #ESSyntaxNode,
	#superclass : #Object,
	#instVars : [
		'symbol',
		'reason',
		'start',
		'end'
	],
	#category : #'EarleySyntaxTree-Public'
}

{ #category : #'instance creation' }
ESSyntaxNode class >> symbol: aSymbol reason: aReason start: firstIndex end: secondIndex [
	^ self basicNew
		initializeSymbol: aSymbol
		reason: aReason
		start: firstIndex
		andEnd: secondIndex
]

{ #category : #accessing }
ESSyntaxNode >> end [
	^ end
]

{ #category : #initialization }
ESSyntaxNode >> initializeSymbol: aSymbol reason: aReason start: firstIndex andEnd: secondIndex [
	self initialize.
	symbol := aSymbol.
	reason := aReason.
	start := firstIndex.
	end := secondIndex
]

{ #category : #testing }
ESSyntaxNode >> isNonterminal [
	^ symbol isNonterminal
]

{ #category : #testing }
ESSyntaxNode >> isTerminal [
	^ symbol isTerminal
]

{ #category : #printing }
ESSyntaxNode >> printOn: aStream [
	aStream
		print: symbol;
		nextPutAll: ' @ [ ';
		print: start;
		nextPutAll: ', ';
		print: end;
		nextPutAll: ' ]'
]

{ #category : #accessing }
ESSyntaxNode >> reason [
	^ reason
]

{ #category : #accessing }
ESSyntaxNode >> start [
	^ start
]

{ #category : #accessing }
ESSyntaxNode >> symbol [
	^ symbol
]
