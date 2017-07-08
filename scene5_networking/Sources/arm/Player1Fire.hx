package arm;

class Player1Fire extends armory.Trait {
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
