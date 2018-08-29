package arm;

import armory.renderpath.HosekWilkie;

class MyTrait extends iron.Trait {
	public function new() {
		super();

		notifyOnUpdate(function() {
			var world = iron.Scene.active.world;
			var light = iron.Scene.active.lights[0];
			
			// Sync sun direction
			var v = light.look();
			world.raw.sun_direction[0] = v.x;
			world.raw.sun_direction[1] = v.y;
			world.raw.sun_direction[2] = v.z;

			// Update sky model
			HosekWilkie.recompute(world);

			// Set world strength
			// world.getGlobalProbe().raw.strength = 1.0;
		});
	}
}
