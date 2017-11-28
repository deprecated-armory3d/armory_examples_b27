package arm;

class Player2Fire extends iron.Trait {
    public function new() {
        super();
        
        notifyOnUpdate(function() {
            var keyboard = iron.system.Input.getKeyboard();

            if (keyboard.started("f")) {
                object.getTrait(FireTrait).fire();
            }
        });
    }
}
