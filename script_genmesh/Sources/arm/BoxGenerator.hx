package arm;

import iron.Scene;
import iron.data.SceneFormat;
import iron.data.Data;
import iron.data.MeshData;
import iron.data.MaterialData;
import iron.system.Input;

@:keep
class BoxGenerator extends iron.Trait {

	var meshData:MeshData;
	var materials:haxe.ds.Vector<MaterialData>;

	function toF32(ar:Array<Float>):kha.arrays.Float32Array {
		var vals = new kha.arrays.Float32Array(ar.length);
		for (i in 0...vals.length) vals[i] = ar[i];
		return vals;
	}

	function toU32(ar:Array<Int>):kha.arrays.Uint32Array {
		var vals = new kha.arrays.Uint32Array(ar.length);
		for (i in 0...vals.length) vals[i] = ar[i];
		return vals;
	}

	public function new() {
		super();

		var pos:TVertexArray = {
			attrib: "pos",
			size: 3,
			values: toF32([1.0,1.0,-1.0,1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0,1.0,-1.0,1.0,1.0,1.0,-1.0,1.0,1.0,-1.0,-1.0,1.0,1.0,-1.0,1.0,1.0,1.0,-1.0,1.0,1.0,1.0,1.0,-1.0,1.0,1.0,-1.0,-1.0,1.0,-1.0,-1.0,1.0,-1.0,1.0,-1.0,-1.0,1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0,1.0,-1.0,1.0,1.0,-1.0,1.0,-1.0,1.0,1.0,1.0,1.0,1.0,-1.0,-1.0,1.0,-1.0,-1.0,1.0,1.0])
		};

		var nor:TVertexArray = {
			attrib: "nor",
			size: 3,
			values: toF32([0.0,0.0,-1.0,0.0,0.0,-1.0,0.0,0.0,-1.0,0.0,0.0,-1.0,0.0,0.0,1.0,0.0,0.0,1.0,0.0,0.0,1.0,0.0,0.0,1.0,1.0,0.0,0.0,1.0,0.0,0.0,1.0,0.0,0.0,1.0,0.0,0.0,0.0,-1.0,-0.0,0.0,-1.0,-0.0,0.0,-1.0,-0.0,0.0,-1.0,-0.0,-1.0,0.0,-0.0,-1.0,0.0,-0.0,-1.0,0.0,-0.0,-1.0,0.0,-0.0,0.0,1.0,0.0,0.0,1.0,0.0,0.0,1.0,0.0,0.0,1.0,0.0])
		};

		var indices:TIndexArray = {
			material: 0,
			values: toU32([0,1,2,0,2,3,4,5,6,4,6,7,8,9,10,8,10,11,12,13,14,12,14,15,16,17,18,16,18,19,20,21,22,20,22,23])
		};

		var rawmeshData:TMeshData = { 
			name: "BoxMesh",
			vertex_arrays: [pos, nor],
			index_arrays: [indices]
		};

		new MeshData(rawmeshData, function(data:MeshData) {
			// Mesh data parsed
			meshData = data;
			meshData.geom.calculateAABB();
			
			// Fetch material from scene data
			Data.getMaterial("Scene", "Material", function(data:MaterialData) {
				// Material loaded
				materials = haxe.ds.Vector.fromData([data]);
				notifyOnUpdate(update);
			});
		});
	}

	function update() {
		// Left mouse button was pressed / display touched / ..
		var mouse = Input.getMouse();
		if (mouse.started()) {
			// Create new object in active scene
			var object = Scene.active.addMeshObject(meshData, materials);
			
			// Just for testing, add rigid body trait
			var aabb = meshData.geom.aabb;
			object.transform.loc.set(Math.random() * 8 - 4, Math.random() * 8 - 4, 5);
			object.transform.buildMatrix();
			object.transform.dim.set(aabb.x, aabb.y, aabb.z);
			object.addTrait(new armory.trait.physics.RigidBody());
		}
	}
}
