package arm;

class PinTrait extends armory.Trait {

	public static var pinsRemoved = 0;

	public function new() {
		super();

		pinsRemoved = 0;

		notifyOnUpdate(function() {

			if (object.transform.loc.z < - 20) {
				object.remove();

				if (++pinsRemoved >= 10) {
					armory.system.Event.send("exit");
				}
			}

		});
	}
}
