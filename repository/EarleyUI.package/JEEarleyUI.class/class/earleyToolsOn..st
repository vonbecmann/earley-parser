menu declaring
earleyToolsOn: aBuilder
	<worldMenu>
	(aBuilder group: #EarleyTools)
		withSeparatorAfter;
		order: 1;
		with: [ 
			(aBuilder item: #Earley)
				with: [ 
					(aBuilder item: #EarleyBrowser)
						label: 'System Browser';
						action: [ self openBrowserInEarleyEnvironment ];
						icon: Smalltalk tools browser taskbarIcon.
					(aBuilder item: #EarleyCode)
						label: 'Lines Of Code';
						action: [ JEStats printLinesOfCode ] ] ]