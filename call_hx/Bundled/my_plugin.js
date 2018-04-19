
// Call Plugin class exposed from Haxe

var plugin = new arm.Plugin();
plugin.hello();

var scene = plugin.scene();
var rot = 0.0;

plugin.update = function() {
	rot += 0.01;
	var o = scene.getChild("Cube");
	o.transform.setRotation(0, 0, rot);
}
