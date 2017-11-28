package arm;

import iron.system.Tween;
import iron.math.Vec4;
import iron.math.Quat;

class MyTrait extends iron.Trait {

    public function new() {
        super();

        notifyOnInit(function() {
            scaleUp();
        });
    }

    var q = new Quat();

    function scaleUp() {
        // Begin tween
        iron.system.Tween.to({
            target: object.transform,
            props: { // Target values to tween
                loc: new Vec4(0, 0, 1),
                scale: new Vec4(1.5, 1.5, 1.5),
                rot: q.fromEuler(0, 0, Math.PI / 2), // Radians
            },
            duration: 1.0,
            // Optional
            delay: 0, // Wait before tweening starts
            tick: function() { trace("Scaling up"); }, // Tweening in progress
            done: scaleDown, // Tweening finished
            ease: Ease.ExpoOut
        });

        // Single vector component
        // iron.system.Tween.to({
        //     target: object.transform.loc,
        //     props: { z: 1.0 },
        //     duration: 1.0,
        //     done: scaleDown,
        //     // Make sure transform matrix gets updated
        //     tick: function() { object.transform.dirty = true; }
        // });
    }

    function scaleDown() {
        iron.system.Tween.to({
            target: object.transform,
            props: {
                loc: new Vec4(0, 0, 0),
                scale: new Vec4(1, 1, 1),
                rot: q.fromEuler(0, 0, 0)
            },
            duration: 1.0,
            delay: 0,
            tick: function() { trace("Scaling down"); },
            done: scaleUp,
            ease: Ease.Linear
        });
    }
}
