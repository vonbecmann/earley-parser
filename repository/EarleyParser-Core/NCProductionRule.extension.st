Extension { #name : 'NCProductionRule' }

{ #category : '*EarleyParser-Core' }
NCProductionRule >> asJERule [
	"converts a production rule to an earley's rule"

	^ JERule head: head body: body copy
]

{ #category : '*EarleyParser-Core' }
NCProductionRule >> makeCopyGiven: grammarBuilder [
	^ self class
		head: (grammarBuilder nonterminalLike: head)
		body: (body collect: [ :each | grammarBuilder nonterminalLike: each ])
]
