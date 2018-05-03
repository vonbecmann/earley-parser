"
an earley one level VW grammar parser.
see oneLevelVWGrammar method on class side.


"
Class {
	#name : #JE1VWParser,
	#superclass : #Object,
	#instVars : [
		'evaluator'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Earley1VW-Core'
}

{ #category : #accessing }
JE1VWParser class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #grammar }
JE1VWParser class >> oneLevelVWGrammar [
	" one level Van Wijngaarden Grammar (1VWG).
A 1VWG is a 4-tuple
	G = <S, T, E, P>, where

S = alphabet, a finite nonempty set of small syntactic marks, which does not contain the delimiters #($: $, $; $. $:)	.
T = symbols, a finite subset of (S)+.
E = initial notion belongs to (S)+.
P = productions, a finite subset of (((S+) - T), ((S*)*)).

Notation
x: y1, y2, ..., yn.
	 "

	| rules |

	rules := #(
#('one level vw grammar' #('rule list'))

#('rule list' #('rule')) 
#('rule list' #('rule list' 'layout' 'rule'))

#('rule' #('notion' 'colon symbol' 'layout' 'alternatives' 'dot symbol'))

#('alternatives' #('alternative option'))
#('alternatives' #('alternatives' 'semicolon symbol' 'layout' 'alternative option'))

#('alternative option' #('alternative')) #('alternative option' #())

#('alternative' #('notion'))
#('alternative' #('alternative' 'comma symbol' 'layout' 'notion'))

#('notion' #('small syntactic mark plus' '((space and small syntactic mark) plus) option'))

#('small syntactic mark plus' #('small syntactic mark symbol'))
#('small syntactic mark plus' #('small syntactic mark plus' 'small syntactic mark symbol'))

#('((space and small syntactic mark) plus) option' #('(space and small syntactic mark) plus'))
#('((space and small syntactic mark) plus) option' #())

#('(space and small syntactic mark) plus' 
		#('space plus' 'small syntactic mark plus'))
#('(space and small syntactic mark) plus' 
		#('(space and small syntactic mark) plus' 'space plus' 'small syntactic mark plus'))

#('space plus' #('space symbol'))
#('space plus' #('space plus' 'space symbol'))

#('layout' #())
#('layout' #('separator plus'))
#('separator plus' #('separator symbol'))
#('separator plus' #('separator plus' 'separator symbol'))
).

	^ JEGrammar
		productionRules: rules 
		representations: 
			{ "Terminal Notion to Representation List"
			('small syntactic mark symbol' -> (JETerminal charSet: ($a to: $z) , '()')).
			('space symbol' -> (JETerminal character: Character space)).
			('comma symbol' -> (JETerminal character: $,)).
			('colon symbol' -> (JETerminal character: $:)).
			('semicolon symbol' -> (JETerminal character: $;)).
			('dot symbol' -> (JETerminal character: $.)).
			('separator symbol' -> (JETerminal charSet: Character separators)).
			}
]

{ #category : #accessing }
JE1VWParser class >> reset [
	instance := nil
]

{ #category : #initialization }
JE1VWParser >> initialize [
	super initialize.
	evaluator := ESSingleSynthesizedAttributeEvaluator 
						grammar: self class oneLevelVWGrammar
						actions: {
(('rule list' -> 2)	
			-> [ :nodes | 
					Array 
						streamContents: [:s | 
							nodes first do: [:each | s nextPut: each ]. 
							nodes third do: [:each | s nextPut: each ]]]).
(('rule' -> 1)			-> [ :nodes | nodes fourth collect: [:each | Array with: nodes first with: each ] ]).
(('alternatives' -> 1) -> [:node | Array with: node]).
(('alternatives' -> 2) -> [:nodes | nodes first copyWith: nodes fourth ]).
(('alternative option' -> 2)	-> [ Array empty ]).
(('alternative' -> 1) 	-> [ :node | Array with: node ]).
(('alternative' -> 2) 	-> [ :nodes | nodes first copyWith: nodes fourth ]).
(('notion' -> 1)			->	[ :nodes | String streamContents: [ :s | nodes do: [ :each | s nextPutAll: each ] ] ]).
(('((space and small syntactic mark) plus) option' -> 2)	
			-> [ String new ]).
(('small syntactic mark plus' -> 2)
			->	[ :nodes | String streamContents: [ :s | nodes do: [ :each | s nextPutAll: each ] ] ]).
(('(space and small syntactic mark) plus' -> 1)
			->	[ :nodes | String streamContents: [ :s | nodes do: [ :each | s nextPutAll: each ] ] ]).
(('(space and small syntactic mark) plus' -> 2)
			->	[ :nodes | String streamContents: [ :s | nodes do: [ :each | s nextPutAll: each ] ] ]).
(('space plus' -> 1) 			-> [ String space ]).
(('space plus' -> 2) 			-> [ String space ]).
(('layout' -> 1) 				-> [ nil ]).
(('layout' -> 2) 				-> [ nil ]).
(('separator plus' -> 1 ) 	-> [ nil ]).
(('separator plus' -> 2 ) 	-> [ nil ]).
(('small syntactic mark symbol' -> 1) -> [ :node | String with: node ])}
]

{ #category : #parsing }
JE1VWParser >> parse: oneLevelVWRuleString [
	" parse 1VW rules from a String and return an Array of production rules "

	^ evaluator evaluate: oneLevelVWRuleString
]
