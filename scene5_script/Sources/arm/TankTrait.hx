package arm;

import armory.trait.physics.RigidBody;

class TankTrait extends iron.Trait {

    static var q = new iron.math.Quat();
    var transform:iron.object.Transform;

    public function new() {
        super();

        notifyOnInit(function() {
            transform = object.transform;
        });
    }

    public function turnLeft() {
        q.fromEuler(0, 0, 0.03);
		transform.rot.mult(q);
		transform.buildMatrix();
		syncRigidBody();
    }

    public function turnRight() {
        q.fromEuler(0, 0, -0.03);
		transform.rot.mult(q);
		transform.buildMatrix();
		syncRigidBody();
    }

    public function forward() {
        var vec = transform.look();
        vec.mult(0.05);
        transform.loc.add(vec);
		transform.buildMatrix();
        syncRigidBody();
    }

    public function backward() {
        var vec = transform.look();
        vec.mult(-0.05);
        transform.loc.add(vec);
		transform.buildMatrix();
        syncRigidBody();
    }

    function syncRigidBody() {
		var rigidBody = object.getTrait(RigidBody);
		if (rigidBody != null) rigidBody.syncTransform();
    }
}
