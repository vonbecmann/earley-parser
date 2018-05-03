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
'metarule:
	metanotion, two colons, layout, hypernotion alternatives, dot symbol.

hypernotion alternatives: 
	hypernotion option;
	hypernotion alternatives, semicolon symbol, layout, hypernotion option.

hypernotion option: hypernotion; .

hypernotion: (protonotion or metanotion) sequence.

(protonotion or metanotion) sequence:
	protonotion or metanotion;
	(protonotion or metanotion) sequence, protonotion or metanotion.

protonotion or metanotion: protonotion; metanotion.

two colons: colon symbol, colon symbol.

metanotion: large syntactic mark sequence.
large syntactic mark sequence:
	large syntactic mark symbol;
	large syntactic mark sequence, large syntactic mark symbol.

protonotion: small syntactic mark sequence.

small syntactic mark sequence:
	small syntactic mark symbol;
	small syntactic mark sequence, small syntactic mark symbol.
	
layout: separator plus; .
separator plus:
	separator symbol;
	separator plus, separator symbol.'
		representations: {
			('small syntactic mark symbol' -> (JETerminal charSet: ($a to: $z) , '()')).
			('large syntactic mark symbol' -> (JETerminal charSet: ($A to: $Z) , ($0 to: $9))).
			('colon symbol' -> (JETerminal character: $:)).
			('semicolon symbol' -> (JETerminal character: $;)).
			('dot symbol' -> (JETerminal character: $.)).
			('separator symbol' -> (JETerminal charSet: Character separators)).}
]
