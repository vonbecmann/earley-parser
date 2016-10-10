private
assertGrammarAccepts: words startingAt: aNonterminalNamed
	self
		assert: ((grammar startAt: aNonterminalNamed) accepts: words)
		description:
			(String
				streamContents: [ :s | 
					s
						nextPutAll: 'grammar doesn''t accept ';
						nextPutAll: words ])