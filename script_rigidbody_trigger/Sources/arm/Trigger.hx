package arm;

import iron.object.Object;
import iron.Scene;
import armory.trait.physics.PhysicsWorld;
import armory.trait.physics.RigidBody;

class Trigger extends iron.Trait {

	var rb:RigidBody;
	var physics:armory.trait.physics.PhysicsWorld;
	var obj:Object;
	
	public function new() {
		super();

		notifyOnInit(function() {
			rb = object.getTrait(RigidBody);
			physics = armory.trait.physics.PhysicsWorld.active;
			obj = Scene.active.getChild("Icosphere");
		});

		notifyOnUpdate(function() {
			// TODO: replace with notifyOnCollisionEnter or notifyOnTriggerEnter once implemented
			// ref: https://github.com/armory3d/armory/issues/331
			var rbs = physics.getContacts(object.getTrait(RigidBody));
			if (rbs != null) {
				for (rb in rbs){
					if(rb.object.name == "Cube"){
						obj.visible = true;
					}
				}
			} else {
				obj.visible = false;
			}
		});
	}
}
