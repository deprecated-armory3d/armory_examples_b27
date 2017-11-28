package arm;

class MyTrait extends iron.Trait {
	public function new() {
		super();
		armory.system.Event.add("button", onEvent);
	}

	function onEvent() {
		var loc = object.transform.loc;
		loc.y += 1;
		if (loc.y > 4) loc.y -= 8;
		object.transform.buildMatrix();
	}
}
