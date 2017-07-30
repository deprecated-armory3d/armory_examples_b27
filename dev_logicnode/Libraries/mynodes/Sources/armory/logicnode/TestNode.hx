package armory.logicnode;

class TestNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run() {
		// Logic for this node
		trace("Hello, World!");

		// Execute next action linked to this node
		super.run();
	}
}
