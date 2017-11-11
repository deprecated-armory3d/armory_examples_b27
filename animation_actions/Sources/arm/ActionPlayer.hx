package arm;

class ActionPlayer extends armory.Trait {
	
	function getAnim() {
		// Trait placed on mesh object
		var anim = object.animation;
		// Trait placed on armature object - retrieve animation from child mesh
		if (anim == null) anim = object.children[0].animation;
		return anim;
	}

	public function new() {
		super();

		notifyOnInit(function() {
			var anim = getAnim();
			anim.notifyOnMarker("my_marker", function() {
				trace("Marker!");
			});
		});

		notifyOnUpdate(function() {
			var kb = iron.system.Input.getKeyboard();

			var anim = getAnim();

			if (kb.started("1")) anim.play("Idle-M");
			else if (kb.started("2")) anim.play("Charge-Punch-M");
			else if (kb.started("3")) anim.play("Left-Punch-M", onPunch);
			else if (kb.started("4")) anim.play("Run-M");
			else if (kb.started("5")) anim.play("Rest");
			else if (kb.started("6")) anim.pause();
			else if (kb.started("7")) anim.resume();
		});
	}

	function onPunch() {
		trace("Punch animation played!");
	}
}
