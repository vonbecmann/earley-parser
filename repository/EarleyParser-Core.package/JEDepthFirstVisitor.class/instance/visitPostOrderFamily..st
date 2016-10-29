visiting
visitPostOrderFamily: aFamily
	"visit in post-order a family"

	postFamilyBlock ifNotNil: [ postFamilyBlock value: aFamily ]