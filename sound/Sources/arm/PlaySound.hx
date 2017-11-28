package arm;

class PlaySound extends iron.Trait {
	public function new() {
		super();

		notifyOnUpdate(function() {

			var mouse = iron.system.Input.getMouse();

			// Mouse clicked
			if (mouse.started()) {

				// Randomly play one of the three hit sounds
				iron.data.Data.getSound('hit' + Std.random(3) + '.wav', function(sound:kha.Sound) {
					iron.system.Audio.play(sound);
				});
			}
		});
	}
}
