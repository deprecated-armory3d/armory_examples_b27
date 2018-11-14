package arm;

class WriteFile extends iron.Trait {
	public function new() {
		super();

		notifyOnInit(function() {

			// File writing in Krom
			// To save data in HTML5, see file_storage example

			#if kha_krom
			// Data to save
			var o = { test: "Hello" };
			var s = haxe.Json.stringify(o);
			
			// Save file into game build folder
			// Playing from Blender the file will be saved at
			// file_write/build_file/debug/krom/my_file.json
			var path = Krom.getFilesLocation() + "/my_file.json";

			// Write file
			var bytes = haxe.io.Bytes.ofString(s);
			Krom.fileSaveBytes(path, bytes.getData());
			#end
		});
	}
}
