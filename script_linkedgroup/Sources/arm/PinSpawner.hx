package arm;

class PinSpawner extends iron.Trait {
	public function new() {
		super();

		notifyOnUpdate(function() {
			var mouse = iron.system.Input.getMouse();
			if (mouse.started()) {
				iron.Scene.active.spawnObject("PinGroup", null, null);
			}
		});
	}
}
