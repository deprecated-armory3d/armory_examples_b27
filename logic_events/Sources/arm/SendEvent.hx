package arm;

import armory.system.Event;

class SendEvent extends iron.Trait {
	public function new() {
		super();

		notifyOnUpdate(function() {
			var mouse = iron.system.Input.getMouse();
			if (mouse.started("left")) {
				Event.send("my_event");
			}
		});
	}
}
