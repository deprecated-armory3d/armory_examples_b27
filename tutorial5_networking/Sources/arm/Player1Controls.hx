package arm;

class Player1Controls extends iron.Trait {

    public function new() {
        super();
        
        notifyOnUpdate(function() {
            var keyboard = iron.system.Input.getKeyboard();
            var tank = object.getTrait(TankTrait);

            if (keyboard.down("left")) {
                tank.turnLeft();
            }

            if (keyboard.down("right")) {
                tank.turnRight();
            }

            if (keyboard.down("up")) {
                tank.forward();
            }

            if (keyboard.down("down")) {
                tank.backward();
            }
        });
    }
}
