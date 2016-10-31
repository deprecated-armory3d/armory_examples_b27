package arm;

class MyTrait extends armory.Trait {
    public function new() {
        super();

        // notifyOnInit(function() {
        // });
        
        notifyOnUpdate(function() {
            object.transform.rotate(armory.math.Vec4.zAxis(), 0.01);
        });

        // notifyOnRemove(function() {
        // });
    }
}
