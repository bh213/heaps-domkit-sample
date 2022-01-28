package screens;
import DomKitApp;

@:uiComp("screen1")
class Screen1Comp extends h2d.Object implements BaseScreen implements h2d.domkit.Object {

    static var SRC =
	<screen1>
		<object id="nested1" class="grid-top-1"/>
		<text  text={"manually added <nested/> component"} class="grid-mid-1"/>
		<nested(5) id="resizeNested" class="grid-top-2"/>
		<button("Toggle 'big' class") id="toggleClass" class="grid-mid-2"/>
		<nested(5) id="filteredNested" class="grid-top-3"/>
		<button("Toggle 'filtered' class") id="filterClass" class="grid-mid-3"/>

		<button("add component") id="addComponent" class="grid-bot-1"/>
		<object id="nested4" class="grid-bot-2"/>
		
	</screen1>;

	public function new(?parent) {
		super(parent);
		initComponent();
		nested1.addChild(new NestedComp(5));
		toggleClass.onClick = () -> resizeNested.dom.toggleClass("big");
		filterClass.onClick = () -> filteredNested.dom.toggleClass("filtered");
		addComponent.onClick = () -> {
			final n = new NestedComp(5);
			nested4.addChild(n);
			n.setPosition(Std.random(100), Std.random(100));
		}
	}

	public function getTitle() {
		return "nested DomKit components and nested CSS matching";
	}
	public function getH2dObject() {
		return this;
	}
	
}

@:uiComp("nested")
class NestedComp extends h2d.Flow implements h2d.domkit.Object {
	
	static var SRC =
	<nested>
		${if (level > 1) <nested(level-1) class={'nested${level}'}/>}
	</nested>;

	public function new(level:Int, ?parent) {
		super(parent);
		initComponent();
	}
}
