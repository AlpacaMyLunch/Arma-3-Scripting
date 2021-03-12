player addAction ["calculate1", {
	_desPos = laserTarget player;
	_targetPosition = getPosASL _desPos;
	_targetAlt = _targetPosition select 2;
	_playerPosition = getPosASL player;
	_playerAlt = _playerPosition select 2;
	_range = _playerPosition distance _targetPosition;
	_2dRange = _playerPosition distance2D _targetPosition;

	_altDiff = _targetAlt - _playerAlt;

	_avgVelocity = 344.808 - (0.014 * _2dRange);
	_velocitySquared = _avgVelocity * _avgVelocity;
	_velocityPowerOfFour = _avgVelocity * _avgVelocity * _avgVelocity * _avgVelocity;
	_rangeSquared = _2dRange * _2dRange;
	_gravity = 9.8066;

	
	_sqrtPart = sqrt ( _velocityPowerOfFour - _gravity * ( _gravity * _rangeSquared + 2 * _altDiff * _velocitySquared ));
	_firingElevation = atan ( _sqrtPart / (_gravity * _2dRange));

	// _firingElevation = deg _firingElevation;
	player globalChat str _firingElevation;
	// copyToClipboard _msg;

}]