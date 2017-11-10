package arm;

class ReadConfig extends armory.Trait {
	public function new() {
		super();

		notifyOnInit(function() {
			var c = Config.inst;
			trace("Text is: " + c.text + ", speed is: " + c.speed);
		});
	}
}
