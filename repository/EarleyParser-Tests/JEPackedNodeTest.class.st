Class {
	#name : #JEPackedNodeTest,
	#superclass : #TestCase,
	#category : 'EarleyParser-Tests-Parsing'
}

{ #category : #tests }
JEPackedNodeTest >> testAsString [
	self
		assert:
			(JEPackedNode
				model:
					((JERule head: (NCNonterminal named: 'A') body: #()) dotAtEnd
						startedAt: (JEColumn number: 10))) asString
		equals: '([A: ·. @ 10])'
]

{ #category : #tests }
JEPackedNodeTest >> testEquals01 [
	| dottedRule one another |
	dottedRule := (JERule head: (NCNonterminal named: 'A') body: #()) dotAtEnd.
	
	one := JEPackedNode model: (dottedRule startedAt: (JEColumn number: 10)).
	another := JEPackedNode model: (dottedRule startedAt: (JEColumn number: 10)).
	
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
JEPackedNodeTest >> testEquals02 [
	| terminal one another |
	terminal := JETerminalItem
		given: (NCTerminal character: $J)
		word: $J
		startedAt: (JEColumn number: 2)
		andEndedAt: (JEColumn number: 3).
	one := JEPackedNode model: terminal.
	another := JEPackedNode model: terminal.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]
