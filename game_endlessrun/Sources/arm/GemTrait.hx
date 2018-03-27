package arm;

class GemTrait extends iron.Trait {

	static var gemsCollected = 0;

	var player:iron.object.Object = null;

	public function new() {
		super();

		notifyOnUpdate(function() {
			object.transform.rotate(iron.math.Vec4.zAxis(), 0.05);

			if (player == null) player = iron.Scene.active.getChild("Player");
			var w1 = object.transform.world;
			var w2 = player.transform.world;
			var d = iron.math.Vec4.distance(w1.getLoc(), w2.getLoc());
			
			// Collect gem
			if (d < 0.6) {
				gemsCollected++;
				object.remove();

				// Update UI
				var canvas = iron.Scene.active.getTrait(armory.trait.internal.CanvasScript);
				canvas.getElement("Score").text = gemsCollected + "";
			}
		});
	}
}
