package arm;

class PinTrait extends iron.Trait {

	public function new() {
		super();

		notifyOnInit(function() {
			trace("Pin spawned!");
		});
	}
}
