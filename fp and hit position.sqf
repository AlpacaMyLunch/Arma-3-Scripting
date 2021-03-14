player addEventHandler ["Fired", {
	_this spawn 
	{
		_output = [];
		_output pushBack time;
		_temp = [];
		_playerPosition = getPosASL player;
		_projectile = _this select 6;
		while {alive _projectile} do {
			_pos = getPosASL _projectile;
			_temp pushBackUnique _pos;
		};
		_output pushBack _playerPosition;
		_output pushBack (_temp select (count _temp) - 1);
		_output pushBack time;
		player globalChat "Impact. Copied.";
		copyToClipboard str _output;
		player globalChat str _output;
	};
}];