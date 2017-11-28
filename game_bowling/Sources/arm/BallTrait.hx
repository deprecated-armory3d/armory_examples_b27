package arm;

import iron.math.Vec4;
import armory.trait.physics.RigidBody;

class BallTrait extends iron.Trait {

	@prop
	var impulse = 65.0;

	var fired = false;
	var rb:RigidBody;
	var start = new Vec4();

	public function new() {
		super();
		
		notifyOnInit(function() {
			rb = object.getTrait(RigidBody);
			start.setFrom(object.transform.loc);
		});

		notifyOnUpdate(function() {

			var kb = iron.system.Input.getKeyboard();
			var tr = object.transform;

			if (!fired) {
				if (kb.started("x") || kb.started("space")) {
					rb.applyImpulse(new Vec4(0, impulse, 0));
					fired = true;
				}
				else if (kb.down("left") && tr.loc.x > -0.9) {
					tr.loc.x -= 0.02;
					tr.buildMatrix();
					rb.syncTransform();
				}
				else if (kb.down("right") && tr.loc.x < 0.9) {
					tr.loc.x += 0.02;
					tr.buildMatrix();
					rb.syncTransform();
				}
			}

			if (fired && tr.loc.z < -10) {
				tr.loc.setFrom(start);
				tr.buildMatrix();
				rb.setLinearVelocity(0, 0, 0);
				rb.setAngularVelocity(0, 0, 0);
				rb.syncTransform();
				fired = false;
			}
		});
	}
}
