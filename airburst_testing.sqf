player addEventHandler ["Fired", {
	_this spawn 
	{
		_travelCameraPos = [0, -5, 3];
		_impactCameraPos = [-10, -10, 6];
		_projectile = _this select 6;
		_falling = false;
		_prevAlt = -99;
		_trajectoryArray = [];
		_playerPosition = getPosASL player;
		_playerPosition pushBack time;
		_trajectoryArray pushBack _playerPosition;
		_cam = "camera" camCreate (position player);
		_cam cameraEffect ["External", "Back"];
		_cam camSetTarget _projectile;
		waitUntil {
			if (isNull _projectile) exitWith {true};
			_pos = getPosASL _projectile;
			_speed = speed _projectile / 3.6;
			_time = time;
			_pos pushBack _speed;
			_pos pushBack _time;
			_trajectoryArray pushBackUnique _pos;
			_alt = _pos select 2;
			player globalChat str _alt;
			if (_alt < _prevAlt) then {_falling = true} else {_prevAlt = _alt};
			_camPos = _travelCameraPos;
			_camCommitSpeed = 0;
			if ((_alt < 200) and (_falling == true)) then {
				_camPos = _impactCameraPos;
				_camCommitSpeed = 2;
			} else {
				_camPos = _travelCameraPos;
				_camCommitSpeed = 0;
			};
			_cam camSetRelPos _camPos;
			_cam camCommit _camCommitSpeed;
			false
		};
		sleep 2;
		_cam cameraEffect ["Terminate", "Back"];
		copyToClipboard str _trajectoryArray;
		camDestroy _cam;
		player addItemToBackpack "MRAWS_HE_F";
	};
}];