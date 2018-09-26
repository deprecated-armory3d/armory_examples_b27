package arm;

import iron.Scene;
import iron.App;
import iron.system.Time;
import armory.system.Event;
import armory.trait.internal.CanvasScript;

class CanvasTrait extends iron.Trait {
	
	var canvas:CanvasScript;
	var clicks = 0;

	public function new() {
		super();

		notifyOnInit(function() {
			// Get canvas attached to scene
			canvas = Scene.active.getTrait(CanvasScript);

			// Notify on button click
			Event.add("buttonEvent", onEvent);
			Event.add("toggleMenu", onToggleMenu);

			canvas.notifyOnReady(function() {
				notifyOnUpdate(update);
			});
		});
	}

	function onEvent() {
		// Set butotn text
		canvas.getElement("MyButton").text = Std.string(++clicks);
	}

	function onToggleMenu() {
		var shape = canvas.getElement("Shape");
		shape.visible = !shape.visible;
	}

	function update() {
		// Canvas may be still being loaded
		if (!canvas.ready) return;

		// Set text
		canvas.getElement("MyText").text = "Hello world";

		// Move image
		var img = canvas.getElement("MyImage");
		var center = App.w() / 2 - img.width / 2;
		img.x = center + Math.sin(Time.time()) * 100;
		img.rotation = canvas.getHandle("Check").selected ? Math.PI / 4 : 0;
	}
}
