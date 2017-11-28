package arm;

class MyTrait extends iron.Trait {
    public function new() {
        super();

        // notifyOnInit(function() {
        // });
        
        notifyOnUpdate(function() {
            object.transform.rotate(iron.math.Vec4.zAxis(), 0.01);
        });

        // notifyOnRemove(function() {
        // });
    }
}
