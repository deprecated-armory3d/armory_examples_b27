package arm;

import iron.math.Vec4;

class MyTrait extends iron.Trait {

	// Property marked with @prop gets exposed in
	// Blender - Properties - Object - Armory Traits panel
    @prop
    var speed:Float = 0.1;

    public function new() {
        super();
        
        notifyOnUpdate(function() {
            object.transform.rotate(Vec4.zAxis(), speed);
        });
    }
}
