package arm;

class Player1Controls extends iron.Trait {

    public function new() {
        super();
        
        notifyOnUpdate(function() {
            var keyboard = iron.system.Input.getKeyboard();
            var gamepad = iron.system.Input.getGamepad(0);
            var tank = object.getTrait(TankTrait);

            if (keyboard.down("left") || gamepad.down("left") > 0.0) {
                tank.turnLeft();
            }

            if (keyboard.down("right") || gamepad.down("right") > 0.0) {
                tank.turnRight();
            }

            if (keyboard.down("up") || gamepad.down("up") > 0.0) {
                tank.forward();
            }

            if (keyboard.down("down") || gamepad.down("down") > 0.0) {
                tank.backward();
            }
        });
    }
}
