player addEventHandler ["Fired", {
	_this spawn 
	{
		_output = [];
		_temp = [];
		_playerPosition = getPosASL player;
		_projectile = _this select 6;
		while {alive _projectile} do {
			_pos = getPosASL _projectile;
			_temp pushBackUnique _pos;
		};
		_output pushBack _playerPosition;
		_output pushBack [(_tempp select (count _temp) - 1)];
		player globalChat "Impact. Copied.";
		copyToClipboard str _output;
	};
}];