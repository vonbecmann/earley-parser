public
accepts: words startingAt: aNonterminalNamed
	"answer if the grammar accepts the given words starting at a nonterminal"

	^ (self startAt: aNonterminalNamed) accepts: words