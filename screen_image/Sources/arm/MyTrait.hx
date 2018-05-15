package arm;

import armory.renderpath.RenderPathCreator;

class MyTrait extends iron.Trait {
	public function new() {
		super();

		notifyOnRender2D(function(g:kha.graphics2.Graphics) {
			if (RenderPathCreator.finalTarget == null) return;

			// Access final composited image that is afterwards drawn to the screen
			var image = RenderPathCreator.finalTarget.image;
			
			g.color = 0xffffffff;
			if (image.g4.renderTargetsInvertedY()) {
				g.drawScaledImage(image, 0, image.height / 5, image.width / 5, -image.height / 5);
			}
			else {
				g.drawScaledImage(image, 0, 0, image.width / 5, image.height / 5);
			}
		});
	}
}
