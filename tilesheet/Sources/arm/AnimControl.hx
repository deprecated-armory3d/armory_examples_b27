package arm;

class AnimControl extends iron.Trait {

	var tilesheet:iron.object.Tilesheet;

	public function new() {
		super();

		notifyOnInit(function() {
			tilesheet = cast(object, iron.object.MeshObject).tilesheet;
			iron.system.Tween.timer(Std.random(8), playAnim);
		});
	}

	function playAnim() {
		tilesheet.play("rest", function() {
			tilesheet.play("idle");
			iron.system.Tween.timer(Std.random(8), playAnim);
		});
	}
}
