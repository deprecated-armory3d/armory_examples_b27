package arm;

import iron.Scene;
import iron.object.CameraObject;
import armory.renderpath.RenderPathCreator;

class SplitScreen extends iron.Trait {
	public function new() {
		super();

		notifyOnInit(function() {

			var drawMeshes = RenderPathCreator.drawMeshes;

			// Single viewport size
			var w = Std.int(iron.App.w() / 2);
			var h = iron.App.h();

			// Retrieve cameras
			var cam1:CameraObject = cast Scene.active.getChild("Camera");
			var cam2:CameraObject = cast Scene.active.getChild("Camera.001");
			cam1.buildProjection(w / h);
			cam2.buildProjection(w / h);

			// Override draw method to draw split screen
			RenderPathCreator.drawMeshes = function() {

				var g = RenderPathCreator.path.currentG;

				// Left viewport
				Scene.active.camera = cam1;
				g.viewport(0, 0, w, h);
				drawMeshes();

				// Right viewport
				Scene.active.camera = cam2;
				g.viewport(w, 0, w, h);
				drawMeshes();
			}
		});
	}
}
