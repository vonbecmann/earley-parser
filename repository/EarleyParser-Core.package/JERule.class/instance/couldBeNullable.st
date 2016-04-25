testing
couldBeNullable
	"could this rule's body be nullable such that it's head symbol becomes nullable"

	^ body allSatisfy: [ :each | each isTerminal not ]