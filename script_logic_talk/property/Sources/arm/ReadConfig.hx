package arm;

class ReadConfig extends iron.Trait {
	public function new() {
		super();

		notifyOnInit(function() {
			// Retrieve property set from logic nodes
			var prop = iron.Scene.global.properties.get("test");
			trace(prop);
		});
	}
}
