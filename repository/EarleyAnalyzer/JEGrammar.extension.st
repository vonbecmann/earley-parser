Extension { #name : #JEGrammar }

{ #category : #'*EarleyAnalyzer' }
JEGrammar >> analyzeAccepts: words [
	^ (JEAnalyticalRecognizer given: self) accepts: words
]
