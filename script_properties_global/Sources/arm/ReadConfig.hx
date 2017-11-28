package arm;

class ReadConfig extends iron.Trait {
	public function new() {
		super();

		notifyOnInit(function() {
			var c = Config.inst;
			trace("Text is: " + c.text + ", speed is: " + c.speed);
		});
	}
}
