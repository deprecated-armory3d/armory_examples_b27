package arm;

// Expose this class for easy access from JS

@:expose
class Plugin extends iron.Trait {

	var update:Void->Void = null;

	public function new() {
		super();
		notifyOnUpdate(function() {
			if (update != null) update();
		});
	}

	public function hello() {
		trace("world");
	}

	public function scene() {
		return iron.Scene.active;
	}
}
