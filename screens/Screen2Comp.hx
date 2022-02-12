package screens;
import DomKitApp;

@:uiComp("screen2")
class Screen2Comp extends h2d.Object implements BaseScreen implements h2d.domkit.Object {

    static var SRC =
	<screen2>
		<squares class="grid-top-1" />
		<squares id="animationSquares" class="grid-top-2"/>
		<squares id="filterSquares" class="grid-top-3"/>
		<button("apply `rotate` class") id="rotateButton" class="grid-mid-2"/>
		<button("apply `filtered` class") id="filterButton" class="grid-mid-3"/>
	</screen2>;

	public function new(?parent) {
		super(parent);
		initComponent();
		rotateButton.onClick = () -> animationSquares.dom.toggleClass("rotate");
		filterButton.onClick = () -> filterSquares.dom.toggleClass("filtered");
	}
	
	public function getTitle() {
		return "custom CSS parsing, transitions, filters";
	}
	public function getH2dObject() {
		return this;
	}
}

@:uiComp("squares")
// See DomKitInit for `$MyComponent` matching
class SquaresMyComponent extends h2d.Flow implements h2d.domkit.Object {
	static var SRC =
	<squares>
		${for (i in 1...5) <bitmap class={'square${i}'}/> }
	</squares>;

	public function new(?parent) {
		super(parent);
		initComponent();
	}
}
