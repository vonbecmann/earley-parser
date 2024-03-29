"
test for a comment grammar.
comment:
	double quote mark symbol,
	(not a double quote mark) star,
	double quote mark symbol.

"
Class {
	#name : #JEDoubleQuoteCommentGrammarTest,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEDoubleQuoteCommentGrammarTest >> setUp [
	super setUp.
	grammar := JEGrammar
		productionRules:
#(	#('comment'
		#('double quote mark symbol' '(not double quote) star' 'double quote mark symbol'))
	#('(not double quote) star' #('not double quote mark symbol' '(not double quote) star'))
	#('(not double quote) star' #()))
		representations:
			{('double quote mark symbol' -> (NCTerminal character: $")).
			('not double quote mark symbol' -> (NCTerminal charSetComplement: '"'))}
]

{ #category : #tests }
JEDoubleQuoteCommentGrammarTest >> testAcceptsDefaultComment [
	self assert: (grammar accepts: '"comment stating purpose of message"')
]

{ #category : #tests }
JEDoubleQuoteCommentGrammarTest >> testAcceptsEmptyComment [
	self assert: (grammar accepts: '""')
]
