tests
testAsArrayRepresentation01
	tree := grammar parseTree: 'word_symbol'.
	self
		assertCollection: tree asArrayRepresentation
		equals: #(#($w) #(#($o) #(#($r) #(#($d) #(#($_) #(#($s) #(#($y) #(#($m) #(#($b) #(#($o) #(#($l) #())))))))))))