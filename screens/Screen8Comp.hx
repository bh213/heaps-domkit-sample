package screens;
import h2d.Text;
import DomKitApp;
import screens.Screen7Comp;

@:uiComp("screen8")
class Screen8Comp extends h2d.Object implements BaseScreen implements h2d.domkit.Object {

    static var SRC =
	<screen8>
	<flow  class="grid-holder grid-top-1">
		<rect class="col1"/>
	</flow>
	<flow  class="grid-holder grid-top-2">
		<rect class="col2"/>
	</flow>
	<flow  class="grid-holder grid-top-3">
		<rect class="col3"/>
	</flow>

	<flow class="grid-bot-3" vertical="true">
		<button("toggle class") id="toggleClass" />
	</flow>
	</screen8>;

	public function new(?parent) {
		super(parent);
		initComponent();
		toggleClass.onClick = () -> this.dom.toggleClass("transitions");
	}
	
	public function getTitle() {
		return "CSS transitions";
	}
	public function getH2dObject() {
		return this;
	}
}




