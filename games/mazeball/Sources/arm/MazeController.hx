package arm;

import iron.Trait;
import iron.system.Input;
import iron.math.Vec4;
import armory.trait.internal.RigidBody;

@:keep
class MazeController extends Trait {

	var body:RigidBody;

	public function new() {
		super();

		notifyOnUpdate(update);
	}

	function update() {
		if (Input.down) {
			// Rotate board with mouse
			object.transform.rotate(new Vec4(0, 1, 0), Input.movementX / 400);
			object.transform.rotate(object.transform.matrix.right(), Input.movementY / 800);
			object.transform.buildMatrix();

			// Reflect transform changes to rigid body
            object.getTrait(RigidBody).syncTransform();
		}
	}
}
