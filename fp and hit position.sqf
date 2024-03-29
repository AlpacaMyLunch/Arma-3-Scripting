player addEventHandler ["Fired", {
	_this spawn 
	{
		_startTime = time;
		_temp = [];
		_playerPosition = getPosASL player;
		_projectile = _this select 6;
		while {alive _projectile} do {
			_pos = getPosASL _projectile;
			_temp pushBackUnique _pos;
		};
		_endTime = time;
		_impactPosition = (_temp select (count _temp) - 1);
		player globalChat "Impact.";
		_range = _playerPosition distance _impactPosition;
		_2dRange = _playerPosition distance2D _impactPosition;
		_playerAlt = _playerPosition select 2;
		_impactAlt = _impactPosition select 2;
		_travelTime = _endTime - _startTime;
		_msg = '{"travel_time": ' + str _travelTime + ', "2d range": ' + str _2dRange + ', "3d range": ' + str _range + ', "end alt": ' + str _impactAlt + ', "start alt": ' + str _playerAlt + ', "ele": XX }';
		copyToClipboard _msg;
		player globalChat _msg;
	};
}];