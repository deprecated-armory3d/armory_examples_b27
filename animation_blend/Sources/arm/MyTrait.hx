package arm;

class MyTrait extends iron.Trait {

	var factor = 0.0;

	public function new() {
		super();

		notifyOnUpdate(function() {
			
			var anim:iron.object.BoneAnimation = cast object.children[0].animation;
			var kb = iron.system.Input.getKeyboard();
			
			// Blend idle and run actions
			// factor 0.0 -> 100% idle
			// factor 0.5 -> 50% idle, 50% run
			// factor 1.0 -> 100% run
			if (kb.down("w")) {
				if (factor <= 0.99) factor += 0.01;
				anim.blend("idle", "run", factor);
			}

			if (kb.down("s")) {
				if (factor >= 0.01) factor -= 0.01;
				anim.blend("idle", "run", factor);
			}
		});
	}
}
