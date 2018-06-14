package arm;

class SwapWeapon extends iron.Trait {

	var weapon = 0;
	var hand:iron.object.Object;
	var sword:iron.object.Object;
	var axe:iron.object.Object;

	public function new() {
		super();

		notifyOnInit(function() {
			var sc = iron.Scene.active;
			hand = sc.getChild("Hand");
			sword = sc.getChild("Sword");
			axe = sc.getChild("Axe");
		});

		notifyOnUpdate(function() {
			var kb = iron.system.Input.getKeyboard();
			if (kb.started("x")) {
				
				var a = weapon == 0 ? sword : axe; // Currently equipped weapon
				var b = weapon == 0 ? axe : sword; // The other weapon

				// Remove current weapon from hand
				hand.removeChild(a);
				a.visible = false;

				// Add the other weapon to hand
				hand.addChild(b);
				b.visible = true;

				// Swap weapon
				weapon = weapon == 0 ? 1 : 0;
			}
		});
	}
}
