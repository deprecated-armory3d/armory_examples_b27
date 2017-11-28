package arm;

import iron.system.Input;
import iron.math.Vec4;
import iron.system.Time;

class MyTrait extends iron.Trait {
	public function new() {
		super();

		notifyOnUpdate(function() {

			var kb = Input.getKeyboard();

			if(kb.down("a") || kb.down("left")){
				object.transform.rotate(new Vec4(0,0,1), -3 * Time.delta);
			} else if(kb.down("d") || kb.down("right")){
				object.transform.rotate(new Vec4(0,0,1), 3 * Time.delta);
			}

		});
	}
}
