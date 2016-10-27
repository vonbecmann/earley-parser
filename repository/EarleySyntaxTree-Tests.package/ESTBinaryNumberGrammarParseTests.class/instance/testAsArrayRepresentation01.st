tests
testAsArrayRepresentation01
	tree := grammar parseTree: '101'.
	self 
		assertCollection: tree asArrayRepresentation 
		equals: #(#(#(#(#(#($1))) #(#($0))) #(#($1))))