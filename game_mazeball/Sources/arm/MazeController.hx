package arm;

import iron.Trait;
import iron.system.Input;
import iron.math.Vec4;
import armory.trait.physics.RigidBody;

@:keep
class MazeController extends Trait {

	var body:RigidBody;

	public function new() {
		super();

		notifyOnUpdate(update);
	}

	function update() {
		var mouse = Input.getMouse();
		if (mouse.down()) {
			// Rotate board with mouse
			object.transform.rotate(new Vec4(0, 1, 0), mouse.movementX / 300);
			object.transform.rotate(object.transform.world.right(), mouse.movementY / 600);
			object.transform.buildMatrix();

			// Reflect transform changes to rigid body
            object.getTrait(RigidBody).syncTransform();
		}
	}
}
