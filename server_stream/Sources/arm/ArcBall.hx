package arm;

import iron.Trait;
import iron.system.Input;
import iron.math.Vec4;

class ArcBall extends Trait {

	public function new() {
		super();
		notifyOnUpdate(update);
	}

	function update() {
		var mouse = Input.getMouse();
		if (mouse.down()) {
			object.transform.rotate(new Vec4(0, 0, 1), mouse.movementX / 100);
			object.transform.buildMatrix();
		}
	}
}
