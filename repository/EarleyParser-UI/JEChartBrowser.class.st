"
an experiment.

"
Class {
	#name : #JEChartBrowser,
	#superclass : #GLMCompositePresentation,
	#category : #'EarleyParser-UI'
}

{ #category : #building }
JEChartBrowser >> compose [
	self title: 'Chart'.
	self 
		act: [ :browser | browser update ] 
		icon: GLMUIThemeExtraIcons glamorousRefresh 
		entitled: 'Update'.
	self tabulator
		with: [ :browser | 
			browser row: #columns.
			browser transmit
				to: #columns;
				andShow: [ :a | 
					a tabulator 
						with: [ :tabulator | 
							self entity do: [ :column | self compose: column in: tabulator ] ] ] ]
]

{ #category : #building }
JEChartBrowser >> compose: column in: tabulator [
	tabulator column: column asString asSymbol.
	tabulator transmit
		to: column asString asSymbol;
		andShow: [ :a | a list display: [ column sortedItems ] ]
]
