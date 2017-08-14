package arm;

class PinSpawner extends armory.Trait {
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
