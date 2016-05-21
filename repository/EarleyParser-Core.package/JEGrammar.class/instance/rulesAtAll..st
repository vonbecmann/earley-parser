accessing
rulesAtAll: associationCollection
	"Answer a new collection of rules which contains all rules at the associations of associationCollection.
	an association like
		aNamedNonterminal -> index   : the rule at index for a named nonterminal
	example:
		'A' -> 1  : the rule at 1 for nonterminal named 'A'
	"

	| associatedRules |
	associatedRules := Array new: associationCollection size.
	associationCollection withIndexDo: [ :each :index | associatedRules at: index put: (self ruleAt: each) ].
	^ associatedRules