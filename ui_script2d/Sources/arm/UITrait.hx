package arm;

import iron.object.Object;
import zui.*;

class UITrait extends iron.Trait {

    var ui:Zui;
    var cube:Object;
    var plane:Object;
    var move = true;

    public function new() {
        super();

        // Load font for UI labels
        iron.data.Data.getFont("font_default.ttf", function(f:kha.Font) {
            ui = new Zui({font: f});
            iron.Scene.active.notifyOnInit(sceneInit);
        });
    }

    function sceneInit() {
        // Store references to cube and plane objects
        cube = iron.Scene.active.getChild("Cube");
        plane = iron.Scene.active.getChild("Plane");
        notifyOnRender2D(render2D);
        notifyOnUpdate(update);
    }

    function render2D(g:kha.graphics2.Graphics) {
        g.end();

        // Start with UI
        ui.begin(g);
        // Make window
        if (ui.window(Id.handle(), 20, 20, 230, 600, true)) {
            // Make panel in this window
            if (ui.panel(Id.handle({selected: true}), "Menu")) {
                ui.indent();

                // Scale sliders
                ui.text("Scale");
                var sx = ui.slider(Id.handle({value: 1.0}), "X", 0, 2, true);
                var sy = ui.slider(Id.handle({value: 1.0}), "Y", 0, 2, true);
                var sz = ui.slider(Id.handle({value: 1.0}), "Z", 0, 2, true);

                // Rotation sliders
                ui.text("Rotation");
                var rx = ui.slider(Id.handle(), "X", 0, 3.14);
                var ry = ui.slider(Id.handle(), "Y", 0, 3.14);
                var rz = ui.slider(Id.handle(), "Z", 0, 3.14);

                // Move checkbox
                move = ui.check(Id.handle({selected: move}), "Move");

                // Toggle buttons
                if (ui.button("Toggle Cube")) {
                    cube.visible = !cube.visible;
                }

                ui.row([1/2, 1/2]);
                if (ui.button("Toggle Plane")) {
                    plane.visible = !plane.visible;
                }
                if (ui.button("Rotate Plane")) {
                    plane.transform.rotate(iron.math.Vec4.zAxis(), Math.random() * 3.14);
                }
                
                ui.unindent();

                // Set cube transform using values set in UI
                cube.transform.setRotation(rx, ry, rz);
                cube.transform.scale.set(sx, sy, sz);
            }
        }
        ui.end();

        g.begin(false);
    }

    function update() {
        // Translate cube location over time
        if (move) {
            cube.transform.loc.x = Math.sin(iron.system.Time.time() * 2);
            cube.transform.dirty = true;
        }
    }
}
