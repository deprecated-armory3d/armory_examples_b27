package arm;

import armory.trait.internal.RigidBody;
import armory.object.Object;

class FireTrait extends armory.Trait {
    public function new() {
        super();
    }

    public function fire() {
        iron.Scene.active.spawnObject("Bullet", null, function(o:Object) {
            o.visible = true;
            object.transform.buildMatrix();
            o.transform.loc.setFrom(object.transform.abs);
		    o.transform.buildMatrix();

            var rigidBody = o.getTrait(RigidBody);
            if (rigidBody != null) rigidBody.syncTransform();

            var vec = object.transform.look();
            vec.mult(7);
            rigidBody.applyImpulse(vec);

            iron.system.Tween.timer(2, o.remove);
        });
    }
}
