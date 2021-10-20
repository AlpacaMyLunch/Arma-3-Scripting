player addEventHandler ["Fired", {
	_this spawn 
	{
		_projectile = _this select 6;
		_initialTime = time;
		_endTime = time;
		_falling = false;
		_prevAlt = -99;
		_trajectoryArray = [];
		_playerPosition = getPosASL player;
		_trajectoryArray pushBack _playerPosition;
		waitUntil {
			if (isNull _projectile) exitWith {true};
			_pos = getPosASL _projectile;
			_alt = _pos select 2;

			if (_alt < _prevAlt) then {_falling = true} else {_prevAlt = _alt};

			if (_falling == true) then {
				_pos pushBack speed _projectile / 3.6;
				_pos pushBack time;
				_trajectoryArray pushBackUnique _pos;
			};
			false
		};
		_endTime = time;
		copyToClipboard str _trajectoryArray;
		player globalChat "Impact after " + str(_endTime - _initialTime) + " seconds.";
		player addItemToBackpack "MRAWS_HE_F";
	};
}];