package arm;

import haxe.io.Bytes;
import iron.object.MeshObject;
import iron.data.MeshData;
import iron.data.SceneFormat;
import iron.Scene;
import iron.format.obj.ObjParser;

class LoadTrait extends iron.Trait {

	function getFormat(asset:Dynamic, format:String):Dynamic {
		var fs:Array<Dynamic> = asset.formats;
		for (i in 0...fs.length) if (fs[i].formatType == format) return fs[i];
		return null;
	}

	public function new() {
		super();

		notifyOnInit(function() {
			// Load Future Car mesh by Dennis Haupt from poly.google.com
			// See https://developers.google.com/poly/develop/web
			var url = "https://poly.googleapis.com/v1/assets/0XrQdpjc4Vk/?key=AIzaSyAME8tuXn8gIaPcxmVaz0qbar0DkR4Kw6Q";
			var http = new haxe.Http(url);
			http.onData = function(data:String) {
				var format = getFormat(haxe.Json.parse(data), "OBJ");
				if (format != null) {
					var root = format.root;
					http = new haxe.Http(root.url);
					http.onData = makeMesh;
					http.request();
				}
			}
			http.request();
		});
	}

	function makeMesh(data:String) {
		// Parse received .obj data
		var mesh = new ObjParser(kha.Blob.fromBytes(Bytes.ofString(data)));
		var raw:TMeshData = {
			name: "Mesh",
			vertex_arrays: [
				{ values: mesh.posa, attrib: "pos" },
				{ values: mesh.nora, attrib: "nor" }
			],
			index_arrays: [
				{ values: mesh.inda, material: 0 }
			]
		};

		// Set as a new mesh for cube object
		new MeshData(raw, function(md:MeshData) {
			var cube = cast(Scene.active.getChild("Cube"), MeshObject);
			cube.data.delete();
			cube.setData(md);
		});
	}
}
