package arm;

import iron.Scene;
import iron.data.Data;
import armory.trait.internal.CanvasScript;

class ReadFile extends iron.Trait {
	public function new() {
		super();

		notifyOnInit(function() {

			// Relative or absolute path to file
			// In this case we load the file placed in the "Bundled/" folder
			var file = "my_file.json";

			// Load the file asynchronously
			Data.getBlob(file, function(b:kha.Blob) {
				// File is now loaded
				// Get string from loaded bytes
				var string = b.toString();

				// Get json from string
				var json = haxe.Json.parse(string);

				// Get canvas trait
				var canvas = Scene.active.getTrait(CanvasScript);

				// Display "my_text" entry found in the loaded json file
				canvas.getElement("Text").text = json.my_text;
			});
		});
	}
}
