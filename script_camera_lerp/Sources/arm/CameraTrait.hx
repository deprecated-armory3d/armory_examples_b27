package arm;

import armory.object.Object;
import armory.Scene;
import armory.math.Quat;

class CameraTrait extends armory.Trait {
	
	var cube:Object;
	
	public function new() {
		super();

		notifyOnInit(function() {
			cube = Scene.active.getChild("Cube");
		});

		notifyOnUpdate(function() {
			if(cube.transform.rot != object.transform.rot){
				var newRot = Quat.lerp(cube.transform.rot, object.transform.rot, 0.9);
				object.transform.rot.setFrom(newRot);
				object.transform.buildMatrix();
			}
		});
	}
}
