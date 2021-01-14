player addAction ["get target", {
	_desPos = laserTarget player;
	_targetPosition = getPosASL _desPos;
	player globalChat str _targetPosition;
}]