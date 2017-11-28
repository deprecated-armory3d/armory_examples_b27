package arm;

import kha.network.Entity;
import kha.network.Sync;

class TankTrait extends iron.Trait implements Entity implements Sync {

    static var q = new iron.math.Quat();
    var transform:iron.object.Transform;

    public function new() {
        super();

        notifyOnInit(function() {
            transform = object.transform;
        });

        notifyOnUpdate(register);
    }

    function register() {
        if (SessionTrait.session != null) {
            SessionTrait.session.addEntity(this);
            removeUpdate(register);
        }
    }

    @synced("all")
    public function turnLeft() {
        q.fromEuler(0, 0, 0.03);
		transform.rot.mult(q);
		transform.buildMatrix();
		syncRigidBody();
    }

    @synced("all")
    public function turnRight() {
        q.fromEuler(0, 0, -0.03);
		transform.rot.mult(q);
		transform.buildMatrix();
		syncRigidBody();
    }

    @synced("all")
    public function forward() {
        var vec = transform.look();
        vec.mult(0.05);
        transform.loc.add(vec);
		transform.buildMatrix();
        syncRigidBody();
    }

    @synced("all")
    public function backward() {
        var vec = transform.look();
        vec.mult(-0.05);
        transform.loc.add(vec);
		transform.buildMatrix();
        syncRigidBody();
    }

    function syncRigidBody() {
		var rigidBody = object.getTrait(armory.trait.physics.RigidBody);
		if (rigidBody != null) rigidBody.syncTransform();
    }
}
