package arm;

class PlayerController extends iron.Trait {
	public function new() {
		super();

		notifyOnUpdate(function() {
			var kb = iron.system.Input.getKeyboard();
			var x = object.transform.loc.x;

			// Move player
			if ((kb.down("left") || kb.down("a")) && x > -1.8) {
				object.transform.loc.x -= 0.06;
				object.transform.dirty = true;
			}
			if ((kb.down("right") || kb.down("d")) && x < 1.8) {
				object.transform.loc.x += 0.06;
				object.transform.dirty = true;
			}
		});
	}
}
