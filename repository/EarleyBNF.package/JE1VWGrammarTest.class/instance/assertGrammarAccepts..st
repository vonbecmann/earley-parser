private
assertGrammarAccepts: words
	self
		assert: (grammar accepts: words)
		description:
			(String
				streamContents: [ :s | 
					s
						nextPutAll: 'grammar doesn''t accept ';
						nextPutAll: words ])