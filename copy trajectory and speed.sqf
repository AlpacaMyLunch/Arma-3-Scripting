player addEventHandler ["Fired", {
	_this spawn 
	{
		_trajectoryArray = [];
		_playerPosition = getPosASL player;
		_trajectoryArray pushBack _playerPosition;
		player globalChat "Fired";
		_bullet = _this select 6;
		while {alive _bullet} do {
			_pos = getPosASL _bullet;
			_speed = speed _bullet / 3.6;
			_pos pushBack _speed;
			_trajectoryArray pushBackUnique _pos;
		};
		player globalChat "Impact";
		copyToClipboard str _trajectoryArray;
	};
}];