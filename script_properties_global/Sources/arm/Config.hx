package arm;

class Config extends iron.Trait {

    @prop public var speed:Float = 0.1;
    @prop public var text:String;

    public static var inst:Config = null;

    public function new() {
        super();
        inst = this;
    }
}
