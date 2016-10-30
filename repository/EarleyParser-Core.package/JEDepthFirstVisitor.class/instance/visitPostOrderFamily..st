visiting
visitPostOrderFamily: aFamily
	"visit in post-order a family"

	postOrderFamilyBlock ifNotNil: [ postOrderFamilyBlock value: aFamily ]