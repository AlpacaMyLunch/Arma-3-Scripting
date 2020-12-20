player addEventHandler ["Fired", {
	_this spawn 
	{
		_trajectoryArray = [];
		player globalChat "Fired";
		_bullet = _this select 6;
		while {alive _bullet} do {
			_pos = getPosASL _bullet;
			_trajectoryArray pushBackUnique _pos;
		};
		player globalChat "Impact";
		copyToClipboard str _trajectoryArray;
	};
}];