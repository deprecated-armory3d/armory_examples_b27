package arm;

import iron.Scene;
import armory.system.Event;
import armory.data.Config;
import armory.trait.internal.CanvasScript;
import armory.renderpath.RenderPathCreator;

// WIP
// To generate config.arm file, enable 'Armory Project - Write Config'
// Fullscreen option will take effect on next game start up (will be resolved)
class MyTrait extends iron.Trait {

	var canvas:CanvasScript;

	public function new() {
		super();

		notifyOnInit(function() {
			canvas = Scene.active.getTrait(CanvasScript);

			// Init UI to values loaded from config.arm file
			canvas.notifyOnReady(function() {
				canvas.getHandle("Fullscreen").selected = Config.raw.window_mode == 1;
				canvas.getHandle("SSAO").selected = Config.raw.rp_ssgi;
				canvas.getHandle("SSR").selected = Config.raw.rp_ssr;
				canvas.getHandle("Bloom").selected = Config.raw.rp_bloom;
				canvas.getHandle("MotionBlur").selected = Config.raw.rp_motionblur;
				canvas.getHandle("Shadows").position = getShadowQuality(Config.raw.rp_shadowmap);
				var cam = Scene.active.camera;
				canvas.getHandle("ViewDistance").value = Std.int(cam.data.raw.far_plane * 100) / 10000;
				canvas.getHandle("FoV").value = Std.int(cam.data.raw.fov * 100) / 100;
			});
			
			// Apply button clicked
			Event.add("apply_settings", applySettings);
		});
	}

	function applySettings() {

		// Apply render path settings
		Config.raw.window_mode = canvas.getHandle("Fullscreen").selected ? 1 : 0;
		Config.raw.rp_ssgi = canvas.getHandle("SSAO").selected;
		Config.raw.rp_ssr = canvas.getHandle("SSR").selected;
		Config.raw.rp_bloom = canvas.getHandle("Bloom").selected;
		Config.raw.rp_motionblur = canvas.getHandle("MotionBlur").selected;
		Config.raw.rp_shadowmap = getShadowMapSize(canvas.getHandle("Shadows").position);
		RenderPathCreator.applyConfig();

		// Apply camera settings
		var cam = Scene.active.camera;
		cam.data.raw.far_plane = canvas.getHandle("ViewDistance").value * 100;
		cam.data.raw.fov = canvas.getHandle("FoV").value;
		cam.buildProjection();

		// Save config.arm file
		Config.save();
	}

	function getShadowQuality(i:Int):Int {
		// 0 - High, 1 - Medium, 2 - Low
		return i == 2048 ? 0 : i == 1024 ? 1 : 2;
	}

	function getShadowMapSize(i:Int):Int {
		// High - 2048, Medium - 1024, Low - 512
		return i == 0 ? 2048 : i == 1 ? 1024 : 512;
	}
}
