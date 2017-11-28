package arm;

import iron.math.Vec4;

class Cube extends iron.Trait {

	@prop
	var speed:Float = 0.5;

	@prop
	var axis:String = 'x';

	var rotationVector:Vec4 = new Vec4();

	public function new() {
		super();

		notifyOnInit(function() {
			if(axis == 'x'){
				rotationVector = new Vec4(1,0,0);
			} else if(axis == 'y'){
				rotationVector = new Vec4(0,1,0);
			} else if(axis == 'z'){
				rotationVector = new Vec4(0,0,1);
			}
		});

		notifyOnUpdate(function() {
			object.transform.rotate(rotationVector, speed * iron.system.Time.delta);
		});

		// notifyOnRemove(function() {
		// });
	}
}
