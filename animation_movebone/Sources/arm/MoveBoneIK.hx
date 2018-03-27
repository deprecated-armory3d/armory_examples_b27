package arm;

import iron.object.BoneAnimation;

// Moving a bone - inverse kinematics
class MoveBoneIK extends armory.Trait {

	public function new() {
		super();

		iron.Scene.active.notifyOnInit(function() {

			// Fetch armature animation
			var anim = cast(object.children[0].animation, BoneAnimation);
			// Fetch bone
			var bone = anim.getBone("mixamorig_LeftHandIndex4");
			// Fetch goal
			var tr = iron.Scene.active.getChild("Goal").transform;
			var goal = new iron.math.Vec4();

			anim.notifyOnUpdate(function() {
				goal.set(tr.worldx(), tr.worldy(), tr.worldz());
				// Align skeleton to touch the goal
				anim.solveIK(bone, goal);
			});
		});
	}
}
