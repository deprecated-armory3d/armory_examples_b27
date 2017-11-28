package arm;

class Player2Controls extends iron.Trait {
    public function new() {
        super();
        
        notifyOnUpdate(function() {
            var keyboard = iron.system.Input.getKeyboard();
            var tank = object.getTrait(TankTrait);

            if (keyboard.down("a")) {
                tank.turnLeft();
            }

            if (keyboard.down("d")) {
                tank.turnRight();
            }

            if (keyboard.down("w")) {
                tank.forward();
            }

            if (keyboard.down("s")) {
                tank.backward();
            }
        });
    }
}
