package arm;

import iron.system.Input;
import armory.trait.physics.PhysicsWorld;

class PickTrait extends iron.Trait {

	public function new() {
		super();

        notifyOnUpdate(function() {
            // Check mouse button
            var mouse = Input.getMouse();
            if (!mouse.started()) return;

            // Pick object at mouse coords
            var rb = PhysicsWorld.active.pickClosest(mouse.x, mouse.y);
            
            // Check if picked object is our Cube
            if (rb != null && rb.object.name == 'Cube') {
                rb.object.transform.translate(0, 0, 1);
                rb.syncTransform();
            }
        });
	}
}
