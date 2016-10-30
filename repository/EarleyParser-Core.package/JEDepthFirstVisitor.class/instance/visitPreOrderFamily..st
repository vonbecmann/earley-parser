visiting
visitPreOrderFamily: aFamily
	"visit in pre-order a family"

	preOrderFamilyBlock ifNotNil: [ preOrderFamilyBlock value: aFamily ]