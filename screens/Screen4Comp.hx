package screens;
import DomKitApp;

@:uiComp("screen4")
class Screen4Comp extends h2d.Object implements BaseScreen implements h2d.domkit.Object {

    static var SRC =
	<screen4>

		<flowSample id="flowSample1" class="grid-top-1"/>
		<flowSample id="flowSample2" class="grid-top-2"/>
		<flowSample id="flowSample3" class="grid-top-3"/>
		

	</screen4>;

	public function new(?parent) {
		super(parent);
		initComponent();
	}

	
	public function getTitle() {
		return "flow";
	}
	public function getH2dObject() {
		return this;
	}
}

@:uiComp("flowSample")
class FlowSampleMyComponent extends h2d.Flow implements h2d.domkit.Object {
	static var SRC =
	<flowSample>
		${for (i in 1...6) <flowItem(${'${i}'}) class={'flow-item-${i}'}/>}
		
	</flowSample>;

	public function new(?parent) {
		super(parent);
		initComponent();

	}

}


@:uiComp("flowItem")

class FlowItemMyComponent extends h2d.Flow implements h2d.domkit.Object {
	static var SRC =
	<flowItem>
		<text text={text}/>
	</flowItem>;

	public function new(text:String, ?parent) {
		super(parent);
		initComponent();

	}

}