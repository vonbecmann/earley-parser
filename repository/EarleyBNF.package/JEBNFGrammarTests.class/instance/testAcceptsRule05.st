tests
testAcceptsRule05
	self assert: (grammar accepts: 'expression:term.expression:expression,$+,term.term:product.term:term,$*,product.product:$a.')