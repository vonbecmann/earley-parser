menu declaring
earleyToolsOn: aBuilder
	<worldMenu>
	(aBuilder group: #EarleyTools)
		withSeparatorAfter;
		order: 1;
		with: [ (aBuilder item: #'Earley Browser')
				action: [ self openBrowserInEarleyEnvironment ];
				keyText: 'o, e';
				icon: Smalltalk tools browser taskbarIcon ]