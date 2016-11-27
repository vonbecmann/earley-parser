initialization
initialize
	super initialize.
	grammar := self class oneLevelVWGrammar.
	ruleToActionCollection := {
(('rule list' -> 1)	-> [ :node | Array with: node ]).
(('rule list' -> 2)	-> [ :nodes | nodes first copyWith: nodes third ]).
(('rule' -> 1)			-> [ :nodes | Array with: nodes first with: nodes fourth ]).
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
(('space plus' -> 1) 		-> [ :node | String space ]).
(('space plus' -> 2) 		-> [ :node | String space ]).
(('layout' -> 1) 			-> [ nil ]).
(('layout' -> 2) 			-> [:node | nil ]).
(('small syntactic mark symbol' -> 1) 
			-> [ :node | String with: node ])}