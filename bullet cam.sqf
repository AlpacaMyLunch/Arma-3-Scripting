player addEventHandler ["Fired", {
	_this spawn 
	{
		_missile = _this select 6;
		_cam = "camera" camCreate (position player);
		_cam cameraEffect ["External", "Back"];
		waitUntil {
			if (isNull _missile) exitWith {true};
			_cam camSetTarget _missile;
			_cam camSetRelPos [0, -5, 3];
			_cam camCommit 0;
			false
		};
		sleep 0.4;
		_cam cameraEffect ["Terminate", "Back"];
		camDestroy _cam;
	};
}];