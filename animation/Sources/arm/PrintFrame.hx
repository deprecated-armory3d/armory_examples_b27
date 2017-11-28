package arm;

@:keep
class PrintFrame extends iron.Trait {

    var frameTime:Float;
    var lastTime:Float = 0;
    var totalTime:Float = 0;
    var frames = 0;

    public function new() {
        super();

        // notifyOnInit(function() {
        // });
        
        notifyOnRender(function(g:kha.graphics4.Graphics) {
            frameTime = kha.Scheduler.realTime() - lastTime;
            lastTime = kha.Scheduler.realTime();
            totalTime += frameTime;
            frames++;
#if webgl
            if (totalTime >= 1) {
                untyped document.title = Std.int(totalTime / frames * 10000) / 10 + ' ms/frame';
                totalTime = 0;
                frames = 0;
            }
#end
        });

        // notifyOnRemove(function() {
        // });
    }
}
