player addEventHandler ["Fired", {
	_this spawn 
	{
		_trajectoryArray = [];
		_playerPosition = getPosASL player;
		_trajectoryArray pushBack _playerPosition;
		player globalChat "Fired";
		_projectile = _this select 6;
		while {alive _projectile} do {
			_pos = getPosASL _projectile;
			_speed = speed _projectile / 3.6;
			_pos pushBack _speed;
			_trajectoryArray pushBackUnique _pos;
		};
		player globalChat "Impact";
		copyToClipboard str _trajectoryArray;
	};
}];