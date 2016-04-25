initialization
initializeNullables
	| changed possibleRules |
	nullables := (nonterminals collect: [ :each | each -> false ]) asDictionary.
	rules select: [ :each | each isEmpty ] thenDo: [ :each | nullables at: each head put: true ].
	possibleRules := rules reject: [ :each | each isEmpty or: [ each couldBeNullable not ] ].
	[ 
	| nextPossibleRules |
	changed := false.
	nextPossibleRules := JELinkedList new.
	possibleRules
		do: [ :each | 
			(each body allSatisfy: [ :symbol | nullables at: symbol ])
				ifTrue: [ 
					nullables at: each head put: true.
					changed := true ]
				ifFalse: [ nextPossibleRules add: each ] ].
	possibleRules := nextPossibleRules ] doWhileTrue: [ changed ]