package arm;

class PinTrait extends armory.Trait {

	public function new() {
		super();

		notifyOnInit(function() {
			trace("Pin spawned!");
		});
	}
}
