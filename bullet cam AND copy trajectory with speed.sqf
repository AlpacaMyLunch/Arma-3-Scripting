player addEventHandler ["Fired", {
	_this spawn 
	{
		_missile = _this select 6;
		_trajectoryArray = [];
		_playerPosition = getPosASL player;
		_trajectoryArray pushBack _playerPosition;
		_cam = "camera" camCreate (position player);
		_cam cameraEffect ["External", "Back"];
		waitUntil {
			if (isNull _missile) exitWith {true};
			_pos = getPosASL _missile;
			_speed = speed _missile / 3.6;
			_pos pushBack _speed;
			_trajectoryArray pushBackUnique _pos;
			_cam camSetTarget _missile;
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