package arm;

import iron.math.Vec4;
import iron.system.Input;
import iron.object.Object;
import armory.trait.physics.PhysicsWorld;
import armory.trait.internal.CameraController;

class ThirdPersonController extends CameraController {

#if (!arm_bullet)
	public function new() { super(); }
#else

	var animObject:String;
	var idleAction:String;
	var runAction:String;
	var state = 0; // Idle, run
	var arm:Object;
	var xVec = Vec4.xAxis();
	var zVec = Vec4.zAxis();
	var dir = new Vec4();

	public function new(animObject = "", idle = "idle", run = "run") {
		super();

		this.animObject = animObject;
		this.idleAction = idle;
		this.runAction = run;

		iron.Scene.active.notifyOnInit(init);
	}

	function findAnimation(o:Object):Object {
		if (o.animation != null) return o;
		for (c in o.children) {
			var co = findAnimation(c);
			if (co != null) return co;
		}
		return null;
	}
	
	function init() {
		if (animObject == "") arm = findAnimation(object);
		else arm = object.getChild(animObject);

		PhysicsWorld.active.notifyOnUpdate(preUpdate);
		notifyOnUpdate(update);
		notifyOnRemove(removed);
	}

	function preUpdate() {
		var mouse = Input.getMouse();
		if (mouse.down()) {
			camera.transform.rotate(xVec, mouse.movementY / 250);
			transform.rotate(zVec, -mouse.movementX / 250);
			transform.buildMatrix();
			camera.buildMatrix();
		}
	}

	function removed() {
		PhysicsWorld.active.removePreUpdate(preUpdate);
	}

	function update() {
		dir.set(0, 0, 0);
		if (moveForward) dir.add(transform.look());
		if (moveBackward) dir.add(transform.look().mult(-1));
		if (moveLeft) dir.add(transform.right().mult(-1));
		if (moveRight) dir.add(transform.right());

		var kb = iron.system.Input.getKeyboard();
		if (kb.started("1")) arm.animation.play("attack1", function() { arm.animation.play("attack_idle"); });
		if (kb.started("2")) arm.animation.play("attack2", function() { arm.animation.play("attack_idle"); });
		if (kb.started("3")) arm.animation.play("attack3", function() { arm.animation.play("attack_idle"); });
		if (kb.started("4")) arm.animation.play("attack5", function() { arm.animation.play("attack_idle"); });

		if (moveForward || moveBackward || moveLeft || moveRight) {
			if (state != 1) {
				if (moveLeft) arm.animation.play("strafe_left", null, 0.2);
				else if (moveRight) arm.animation.play("strafe_right", null, 0.2);
				else arm.animation.play("walk", null, 0.2);
				state = 1;		
			}
			dir.mult(-4 * 0.7);
			transform.translate(dir.x / 40, dir.y / 40, dir.z / 40);
		}
		else {
			if (state != 0) {
				arm.animation.play("attack_idle", null, 0.2);
				state = 0;
			}
		}
		camera.buildMatrix();
	}
#end
}
