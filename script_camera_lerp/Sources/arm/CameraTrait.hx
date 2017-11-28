package arm;

import iron.object.Object;
import iron.Scene;
import iron.math.Quat;

class CameraTrait extends iron.Trait {
	
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
