package screens;
import DomKitApp;

@:uiComp("screen3")
class Screen3Comp extends h2d.Object implements BaseScreen implements h2d.domkit.Object {

    static var SRC =
	<screen3>
		<flow id="list" class="grid-top-2">
		</flow>
		<flow class="grid-mid-3 button-list" vertical="true">
			<button("add item") id="addItemButton" />
			<button("clear list") id="clearButton" />
		</flow>
		

	</screen3>;

	public function new(?parent) {
		super(parent);
		initComponent();
		addItemButton.onClick = () -> {
			final item = new ItemMyComponent('${Std.random(1000)}');
			list.addChild(item);
			haxe.Timer.delay(()-> item.dom.addClass('added'), 30);
		}
		clearButton.onClick = () -> {

			for (c in list.children) {
				if (Std.isOfType(c, ItemMyComponent)) c.dom.removeClass("added");
			}
			haxe.Timer.delay(()-> list.removeChildren(), 500);
		}
	}

	
	public function getTitle() {
		return "dynamically removing DomComponents, pseudo-classes, custom CSS parsing (font)";
	}
	public function getH2dObject() {
		return this;
	}
}

@:uiComp("item")
// See DomKitInit for `$MyComponent` matching
class ItemMyComponent extends h2d.Flow implements h2d.domkit.Object {
	static var SRC =
	<item>
		<text text={text}/>
	</item>;

	public function new(text:String, ?parent) {
		super(parent);
		initComponent();

	}

}
