package arm;

class Player1Fire extends iron.Trait {
    public function new() {
        super();
        
        notifyOnUpdate(function() {
            var keyboard = iron.system.Input.getKeyboard();
            var gamepad = iron.system.Input.getGamepad(0);

            if (keyboard.started("m") || gamepad.started("cross")) {
                object.getTrait(FireTrait).fire();
            }
        });
    }
}
