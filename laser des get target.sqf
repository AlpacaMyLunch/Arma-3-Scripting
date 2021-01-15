player addAction ["get target", {
	_desPos = laserTarget player;
	_targetPosition = getPosASL _desPos;
	_targetAlt = _targetPosition select 2;
	_playerPosition = getPosASL player;
	_playerAlt = _playerPosition select 2;
	_range = _playerPosition distance _targetPosition;
	_2dRange = _playerPosition distance2D _targetPosition;

	_msg = '{"2d range": ' + str _2dRange + ', "3d range": ' + str _range + ', "end alt": ' + str _targetAlt + ', "start alt": ' + str _playerAlt + ', "ele": XX }';
	player globalChat _msg;
	copyToClipboard _msg;

}]