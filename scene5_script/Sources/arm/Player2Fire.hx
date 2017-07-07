package arm;

class Player2Fire extends armory.Trait {
    public function new() {
        super();
        
        notifyOnUpdate(function() {
            var keyboard = iron.system.Input.getKeyboard();
            var gamepad = iron.system.Input.getGamepad(1);

            if (keyboard.started("f") || gamepad.started("cross")) {
                object.getTrait(FireTrait).fire();
            }
        });
    }
}
