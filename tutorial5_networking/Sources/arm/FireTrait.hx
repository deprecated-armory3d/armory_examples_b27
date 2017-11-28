package arm;

import kha.network.Entity;
import kha.network.Sync;
import iron.object.Object;

class FireTrait extends iron.Trait implements Entity implements Sync {
    public function new() {
        super();
    }

    @synced("all")
    public function fire() {
        iron.Scene.active.spawnObject("Bullet", null, function(o:Object) {
            o.visible = true;
            object.transform.buildMatrix();
            o.transform.loc.setFrom(object.transform.world.getLoc());
		    o.transform.buildMatrix();

            var rigidBody = o.getTrait(armory.trait.physics.RigidBody);
            if (rigidBody != null) rigidBody.syncTransform();

            var vec = object.transform.look();
            vec.mult(7);
            rigidBody.applyImpulse(vec);

            iron.system.Tween.timer(2, o.remove);
        });
    }
}
