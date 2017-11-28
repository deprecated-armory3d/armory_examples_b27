package arm;

import iron.system.Time;
import iron.math.Vec4;

class TouchTrait extends iron.Trait {

	var touches = [false, false, false];

	public function new() {
		super();

		notifyOnInit(function() {
			var surface = kha.input.Surface.get();
			if (surface != null) surface.notify(touchStart, touchEnd, touchMove);
			notifyOnUpdate(update);
		});
	}

	function update() {
		if (touches[0]) object.transform.rotate(Vec4.zAxis(), 0.05);
		if (touches[1]) object.transform.loc.x = Math.sin(Time.time()) * 3.0;
		if (touches[2]) object.transform.loc.z = Math.cos(Time.time());
		object.transform.dirty = true;
	}

	function touchStart(index:Int, x:Int, y:Int) {
		if (index > 2) return;
		touches[index] = true;
	}

	function touchEnd(index:Int, x:Int, y:Int) {
		if (index > 2) return;
		touches[index] = false;
	}

	function touchMove(index:Int, x:Int, y:Int) {}
}
