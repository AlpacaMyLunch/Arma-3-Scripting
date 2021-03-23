
player addAction ["get_altitude", {
	_playerPosition = getPosASL player;
	player globalChat str (_playerPosition select 2);
	copyToClipboard str (_playerPosition select 2);
}]