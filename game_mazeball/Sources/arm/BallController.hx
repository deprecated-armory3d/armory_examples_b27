package arm;

import iron.Trait;
import iron.Scene;
import iron.object.Object;
import iron.math.Vec4;
import armory.trait.physics.RigidBody;

@:keep
class BallController extends Trait {

	var finish:Object;
	static var v1 = new Vec4();
	static var v2 = new Vec4();

	public function new() {
		super();

		Scene.active.notifyOnInit(function() {
			// Store reference to finish
			finish = Scene.active.getChild("Finish");
			notifyOnUpdate(update);
		});
	}

	function update() {
		// Do not allow sleeping for ball
		object.getTrait(RigidBody).setActivationState(1);

		// Check distance from ball to finish
		var t1 = object.transform;
		var t2 = finish.transform;
		v1.set(t1.worldx(), t1.worldy(), t1.worldz());
		v2.set(t2.worldx(), t2.worldy(), t2.worldz());
		v1.subvecs(v1, v2);
		var dist = v1.length();
		if (dist < 1) {
			trace("Finish!");
		}
	}
}
