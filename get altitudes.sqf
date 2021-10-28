player addAction["get altitudes", {
	_minLat = 15060;
	_maxLat = 15090;
	_minLon = 18200;
	_maxLon = 18290;

	_output = [];


	for "_currentLat" from _minLat to _maxLat do {
		player globalChat "Starting lat " + str _currentLat;
		for "_currentLon" from _minLon to _maxLon do {
			// player globalChat str _currentLat + ' - ' + str _currentLon;
			_alt = getTerrainHeightASL [_currentLat,_currentLon];
			_temp = [_currentLat, _currentLon, _alt];
			_output pushBack _temp;
		};
	};
	



	player globalChat "Finished.";
	copyToClipboard str _output;
	
}]