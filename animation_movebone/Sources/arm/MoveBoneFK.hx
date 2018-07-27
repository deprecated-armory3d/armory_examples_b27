package arm;

import iron.object.BoneAnimation;
import iron.math.Mat4;

// Moving a bone - forward kinematics
class MoveBoneFK extends iron.Trait {

	public function new() {
		super();

		notifyOnInit(function() {
			// Fetch armature animation
			var anim = cast(object.children[0].animation, BoneAnimation);
			// Fetch bone
			var bone = anim.getBone("mixamorig_LeftArm");
			
			// Manipulating bone in local space
			// var m = anim.getBoneMat(bone);
			// anim.notifyOnUpdate(function() {
				// m.translate(Math.sin(iron.system.Time.time()) * 50, 0, 0);
			// });

			// Manipulating bone in world space
			var m = anim.getBoneMat(bone);
			var w = anim.getAbsMat(bone);
			var iw = Mat4.identity();
			anim.notifyOnUpdate(function() {
				m.setFrom(w);
				m.translate(10, 0, Math.sin(iron.system.Time.time()) * 50);
				iw.getInverse(w);
				m.multmat2(iw);
			});
		});
	}
}
