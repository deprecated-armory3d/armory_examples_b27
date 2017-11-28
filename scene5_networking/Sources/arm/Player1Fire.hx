package arm;

class Player1Fire extends iron.Trait {
    public function new() {
        super();
        
        notifyOnUpdate(function() {
            var keyboard = iron.system.Input.getKeyboard();

            if (keyboard.started("m")) {
                object.getTrait(FireTrait).fire();
            }
        });
    }
}
