visiting
visitPreOrderFamily: aFamily
	"visit in pre-order a family"

	preFamilyBlock ifNotNil: [ preFamilyBlock value: aFamily ]