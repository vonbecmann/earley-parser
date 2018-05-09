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
'vw grammar: metaproductions, layout, hyper rules.

metaproductions:
	metaproduction rule;
	metaproductions, layout, metaproduction rule.
metaproduction rule:
	metanotion, colon symbol, colon symbol, layout, hypernotion alternatives, dot symbol.
hypernotion alternatives: 
	hypernotion option;
	hypernotion alternatives, semicolon symbol, layout, hypernotion option.
hypernotion option: hypernotion; .

hyper rules:
	hyper rule;
	hyper rules, layout, hyper rule.
hyper rule:
	hypernotion, colon symbol, layout, hyperalternatives, dot symbol.
hyperalternatives:
	hyperalternative option;
	hyperalternatives, semicolon symbol, layout, hyperalternative option.
hyperalternative option: hyperalternative; .
hyperalternative: 
	hypernotion;
	hyperalternative, comma symbol, layout, hypernotion.

hypernotion: (protonotion or metanotion) plus.

(protonotion or metanotion) plus:
	protonotion then metanotion; 
	metanotion then protonotion.

protonotion then metanotion:
	protonotion;
	protonotion, metanotion then protonotion;
	protonotion, space plus, (protonotion or metanotion) plus.

metanotion then protonotion:
	metanotion;
	metanotion, protonotion then metanotion;	
	metanotion, space plus, (protonotion or metanotion) plus. 
	
metanotion: large syntactic mark plus.
large syntactic mark plus:
	large syntactic mark symbol;
	large syntactic mark plus, large syntactic mark symbol.

protonotion: small syntactic mark plus.
small syntactic mark plus:
	small syntactic mark symbol;
	small syntactic mark plus, small syntactic mark symbol.
	
space plus: 
	space symbol;
	space plus, space symbol.

layout: separator plus; .
separator plus:
	separator symbol;
	separator plus, separator symbol.'
		representations: {
			('small syntactic mark symbol' -> (NCTerminal charSet: ($a to: $z) , '()')).
			('large syntactic mark symbol' -> (NCTerminal charSet: ($A to: $Z) , ($0 to: $9))).
			('space symbol' -> (NCTerminal character: Character space)).
			('colon symbol' -> (NCTerminal character: $:)).
			('semicolon symbol' -> (NCTerminal character: $;)).
			('comma symbol' -> (NCTerminal character: $,)).
			('dot symbol' -> (NCTerminal character: $.)).
			('separator symbol' -> (NCTerminal charSet: Character separators)).}
]
