player addAction["get altitudes", {
	_minLat = 02000;
	_maxLat = 27800;
	_minLon = 05300;
	_maxLon = 25300;

	_output = [];


	for "_currentLat" from _minLat to _maxLat do {
		_tempLat = str _currentLat splitString "";
		_len = count _tempLat;
		_lastIndex = _len - 1;
		_lastDigit = _tempLat select(_lastIndex);
		if ((_lastDigit == "0") or (_lastDigit == "5")) then {
			for "_currentLon" from _minLon to _maxLon do {
				_tempLon = str _currentLon splitString "";
				_len = count _tempLon;
				_lastIndex = _len - 1;
				_lastDigit = _tempLon select(_lastIndex);
				if ((_lastDigit == "0") or (_lastDigit == "5")) then {
					player globalChat str _currentLat + ' - ' + str _currentLon;
					_alt = getTerrainHeightASL [_currentLat,_currentLon];
					_temp = [_currentLat, _currentLon, _alt];
					_output pushBack _temp;
				};
			};
		};
	};
	
	player globalChat "Finished.";
	copyToClipboard str _output;
	
}]