"
an earley VW grammar (two level grammar) parser.
see vwGrammar method on class side.



"
Class {
	#name : #JEVWParser,
	#superclass : #Object,
	#category : #'EarleyVW-Core'
}

{ #category : #grammar }
JEVWParser class >> vwGrammar [
	^ JEGrammar
		e1vw: 
'metanotion: large syntactic mark sequence.
large syntactic mark sequence:
	large syntactic mark symbol;
	large syntactic mark sequence, large syntactic mark symbol.'
		representations: {
			('small syntactic mark symbol' -> (JETerminal charSet: ($a to: $z) , '()')).
			('large syntactic mark symbol' -> (JETerminal charSet: ($A to: $Z) , ($0 to: $9))).}
]
