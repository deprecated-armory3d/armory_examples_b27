package arm;

import armory.trait.physics.PhysicsWorld;

class RayCastTrait extends iron.Trait {

    var q = new iron.math.Quat();

    public function new() {
        super();
        
        notifyOnUpdate(function() {
            var mouse = iron.system.Input.getMouse();
            var keyboard = iron.system.Input.getKeyboard();

            if (mouse.down()) {
                var physics = PhysicsWorld.active;

                // Start from cone location
                var from = object.transform.world.getLoc();

                // Cast ray in the direction cone points to
                var to = object.transform.look();

                // 1000 units long
                to.mult(1000);

                // End position
                to.add(from);
                
                var rb = physics.rayCast(from, to);
                if (rb != null) {
                    trace(rb.object.name);
                }
            }

            if (keyboard.down("left")) {
                q.fromEuler(0, 0, 0.1);
		        object.transform.rot.mult(q);
		        object.transform.buildMatrix();
            }

            if (keyboard.down("right")) {
                q.fromEuler(0, 0, -0.1);
		        object.transform.rot.mult(q);
		        object.transform.buildMatrix();
            }
        });
    }
}
