package arm;

class Player2Controls extends iron.Trait {
    public function new() {
        super();
        
        notifyOnUpdate(function() {
            var keyboard = iron.system.Input.getKeyboard();
            var gamepad = iron.system.Input.getGamepad(1);
            var tank = object.getTrait(TankTrait);

            if (keyboard.down("a") || gamepad.down("left") > 0.0) {
                tank.turnLeft();
            }

            if (keyboard.down("d") || gamepad.down("right") > 0.0) {
                tank.turnRight();
            }

            if (keyboard.down("w") || gamepad.down("up") > 0.0) {
                tank.forward();
            }

            if (keyboard.down("s") || gamepad.down("down") > 0.0) {
                tank.backward();
            }
        });
    }
}
