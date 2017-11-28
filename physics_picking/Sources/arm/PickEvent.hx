package arm;

import kha.input.Mouse;
import armory.trait.physics.PhysicsWorld;

// Using mouse events
class PickEvent extends iron.Trait {

	public function new() {
		super();

		notifyOnInit(function() {
			Mouse.get().notify(onMouseDown, onMouseUp, onMouseMove, onMouseWheel);
		});

		notifyOnRemove(function() {
			// Trait or its object is removed, remove event listeners
			Mouse.get().remove(onMouseDown, onMouseUp, onMouseMove, onMouseWheel);
		});
	}

	function onMouseDown(button: Int, x: Int, y: Int) {
		// Pick object at mouse coords
		var rb = PhysicsWorld.active.pickClosest(x, y);
		
		// Check if picked object is our Cube
		if (rb != null && rb.object.name == 'Cube') {
			rb.object.transform.translate(0, 0, 1);
			rb.syncTransform();
		}
	}

	function onMouseUp(button: Int, x: Int, y: Int) { }
	function onMouseMove(x: Int, y: Int, movementX: Int, movementY: Int) { }
	function onMouseWheel(delta: Int) { }
}
