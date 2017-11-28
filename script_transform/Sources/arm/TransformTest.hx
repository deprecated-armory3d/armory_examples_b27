package arm;

class TransformTest extends iron.Trait {
    public function new() {
        super();

        notifyOnInit(function() {

            // Testing 2 cubes, parent cube at (1, 0, 0),
            // child cube at (5, 0, 0)

            // Parent location
            trace(object.parent.transform.loc);
            // (1, 0, 0)

            // Child location
            trace(object.transform.loc);
            // (5, 0, 0)

            // Child location in world space
            trace(object.transform.world.getLoc());
            // (6, 0, 0)

            // Set child to parent location
            object.transform.loc.set(0, 0, 0);
            object.transform.buildMatrix();
            
            // Child location
            trace(object.transform.loc);
            // (0, 0, 0)

            // Child location in world space
            trace(object.transform.world.getLoc());
            // (1, 0, 0)

            // Move parent
            object.parent.transform.loc.set(0, 3, 0);
            object.parent.transform.buildMatrix();

            // Child location
            trace(object.transform.loc);
            // (0, 0, 0)

            // Child location in world space
            trace(object.transform.world.getLoc());
            // (0, 3, 0)

            // Nore: In Blender, you may need to
            // Clear Parent - Clear Parent Inverse
            // To get local transform
        });
    }
}
