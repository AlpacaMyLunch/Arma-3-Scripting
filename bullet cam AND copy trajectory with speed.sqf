player addEventHandler ["Fired", {
	_this spawn 
	{
		_projectile = _this select 6;
		_trajectoryArray = [];
		_playerPosition = getPosASL player;
		_trajectoryArray pushBack _playerPosition;
		_cam = "camera" camCreate (position player);
		_cam cameraEffect ["External", "Back"];
		waitUntil {
			if (isNull _projectile) exitWith {true};
			_pos = getPosASL _projectile;
			_speed = speed _projectile / 3.6;
			_time = time;
			_pos pushBack _speed;
			_pos pushBack _time;
			_trajectoryArray pushBackUnique _pos;
			_cam camSetTarget _projectile;
			_cam camSetRelPos [0, -5, 3];
			_cam camCommit 0;
			false
		};
		sleep 0.4;
		_cam cameraEffect ["Terminate", "Back"];
		copyToClipboard str _trajectoryArray;
		camDestroy _cam;
	};
}];