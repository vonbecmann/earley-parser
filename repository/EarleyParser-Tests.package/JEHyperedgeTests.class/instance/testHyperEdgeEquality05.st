tests
testHyperEdgeEquality05
	| one another |

	one := JEBDirectedHyperedge 
					sourceNodes: {(JEHypernode model: 'P')} 
					targetNode: (JEHypernode model: 'Start').
	another := JEBDirectedHyperedge 
					sourceNodes: {(JEHypernode model: 'P')} 
					targetNode: (JEHypernode model: 'Start').	

	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another