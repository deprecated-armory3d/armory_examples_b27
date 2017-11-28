package arm;

import iron.system.Input;
import armory.trait.physics.PhysicsWorld;

// This example shows how to JavaScript after clicking on a Cube object
// Requires physics enabled and browser target

class HtmlAccess extends iron.Trait {

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

                // We could do this using Haxe externs,
                // to keep things familiar we will inject raw JS code
                // Using this we can manipulate html page that we are running in
                // or send and retrieve events from the outside
                untyped __js__('document.title = "Cube clicked!"');
                untyped __js__('console.log("Testing..");');
            }
        });
	}
}
