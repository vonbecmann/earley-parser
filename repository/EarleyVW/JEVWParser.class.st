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
'metaproductions:
	metaproduction rule;
	metaproductions, layout, metaproduction rule.

metaproduction rule:
	metanotion, two colons, layout, hypernotions separated by semicolon, dot symbol.
two colons: colon symbol, colon symbol.
	
hypernotions separated by semicolon: 
	hypernotion option;
	hypernotions separated by semicolon, semicolon symbol, layout, hypernotion option.
hypernotion option: hypernotion; .

hyper rule:
	hypernotion, colon symbol, layout, hyperalternatives separated by semicolon, dot symbol.
hyperalternatives separated by semicolon:
	hyperalternative option;
	hyperalternatives separated by semicolon, semicolon symbol, layout, hyperalternative option.
hyperalternative option: hyperalternative; .
hyperalternative: 
	hypernotion;
	hyperalternative, comma symbol, layout, hypernotion.

hypernotion: (protonotion or metanotion) sequence.
(protonotion or metanotion) sequence:
	protonotion or metanotion;
	(protonotion or metanotion) sequence, space plus, protonotion or metanotion.
protonotion or metanotion: protonotion; metanotion.

metanotion: large syntactic mark sequence.
large syntactic mark sequence:
	large syntactic mark symbol;
	large syntactic mark sequence, large syntactic mark symbol.

protonotion: small syntactic mark sequence.
small syntactic mark sequence:
	small syntactic mark symbol;
	small syntactic mark sequence, small syntactic mark symbol.
	
space plus: 
	space symbol;
	space plus, space symbol.

layout: separator plus; .
separator plus:
	separator symbol;
	separator plus, separator symbol.'
		representations: {
			('small syntactic mark symbol' -> (JETerminal charSet: ($a to: $z) , '()')).
			('large syntactic mark symbol' -> (JETerminal charSet: ($A to: $Z) , ($0 to: $9))).
			('space symbol' -> (JETerminal character: Character space)).
			('colon symbol' -> (JETerminal character: $:)).
			('semicolon symbol' -> (JETerminal character: $;)).
			('comma symbol' -> (JETerminal character: $,)).
			('dot symbol' -> (JETerminal character: $.)).
			('separator symbol' -> (JETerminal charSet: Character separators)).}
]
