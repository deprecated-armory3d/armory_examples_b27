package arm;

import iron.object.BoneAnimation;

// Moving a bone - forward kinematics
class MoveBoneFK extends armory.Trait {

	public function new() {
		super();

		iron.Scene.active.notifyOnInit(function() {
			// Fetch armature animation
			var anim = cast(object.children[0].animation, BoneAnimation);
			// Fetch bone
			var bone = anim.getBone("mixamorig_LeftArm");
			// Fetch bone matrix - this is in local bone space for now
			var m = anim.getBoneMat(bone);
			anim.notifyOnUpdate(function() {
				m.translate(Math.sin(iron.system.Time.time()) * 50, 0, 0);
			});
		});
	}
}
