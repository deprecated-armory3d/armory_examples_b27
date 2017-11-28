package arm;

import iron.math.Vec4;

class SensorTrait extends iron.Trait {
	public function new() {
		super();

		notifyOnInit(function() {
			var gyro = kha.input.Sensor.get(kha.input.SensorType.Gyroscope);
			if (gyro != null) gyro.notify(onGyroscope);
		});
	}

	function onGyroscope(x:Float, y:Float, z:Float) {
		object.transform.rotate(Vec4.xAxis(), x / 20);
		object.transform.rotate(Vec4.yAxis(), y / 20);
		object.transform.rotate(Vec4.zAxis(), z / 20);
	}
}
