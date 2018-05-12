Extension { #name : #NCProductionRule }

{ #category : #'*EarleyParser-Core' }
NCProductionRule >> asJERule [
	"converts a production rule to an earley's rule"

	^ JERule head: head body: body copy
]
