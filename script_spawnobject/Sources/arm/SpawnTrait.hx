package arm;

class SpawnTrait extends iron.Trait {
	public function new() {
		super();

		notifyOnInit(function() {

			// Spawn object from scene hierarchy, including children
			iron.Scene.active.spawnObject("Cube", null, function(object:iron.object.Object) {
				object.transform.loc.set(0, 4, 0);
				object.transform.buildMatrix();
			});

			// Spawn single object from scene hierarchy
			var spawnChildren = false;
			iron.Scene.active.spawnObject("Cube", null, function(object:iron.object.Object) {
				object.transform.loc.set(-4, 0, 0);
				object.transform.buildMatrix();
			}, spawnChildren);
		});
	}
}
