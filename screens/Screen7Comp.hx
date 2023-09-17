package screens;
import h2d.Text;
import DomKitApp;
import screens.Screen5Comp;

@:uiComp("screen7")
class Screen7Comp extends h2d.Object implements BaseScreen implements h2d.domkit.Object {

    static var SRC =
	<screen7>
	<flow  class="grid-holder grid-top-1">
		<rect/>
	</flow>
	<flow  class="grid-holder grid-top-2">
		<rect width="50" height="50" rect-color="red"/>
	</flow>
	<flow  class="grid-holder grid-top-3">
		<rect id="rect7"/>
	</flow>
	</screen7>;

	public function new(?parent) {
		super(parent);
		initComponent();
	}
	
	public function getTitle() {
		return "creating components using @:domkitDecl - see code";
	}
	public function getH2dObject() {
		return this;
	}
}

class Rectange extends h2d.Graphics {
	
	@:p public var width(default, set):Int;
	@:p public var height(default, set):Int;
	@:p public var rectColor(default, set):Int;
	var redraw = true;
	
	function set_height(height:Int):Int {
		this.height = height;
		redraw = true;
		return this.height;
	}
	
	function set_width(width:Int):Int {
		this.width = width;
		redraw = true;
		return this.width;
	}

	function set_rectColor(color:Int):Int {
		trace(StringTools.hex(color));
		this.rectColor = color;
		redraw = true;
		return this.rectColor;
	}
	
	public function new(?parent) {
		super(parent);
		width = 100;
		height = 100;
		rectColor = 0xffffffff;
		redraw = true;
	}

	function update() {
		this.clear();
		this.setColor(rectColor);
		this.beginFill(rectColor, 1);
		this.drawRect(0,0, width, height);
		this.endFill();
		redraw = false;
	}

	override function sync(ctx) {
		if (redraw ) update();
		super.sync(ctx);
		
	}
}

@:uiComp("rect")  @:domkitDecl
class RectMyComponent extends h2d.domkit.BaseComponents.ObjectComp implements domkit.Component.ComponentDecl<Rectange>{
	@:p var width : Int;
	@:p var height : Int;
	@:p(color) var rectColor : Int;
	//@:p var doesNotExist:Int; screens.Rectangle has no field doesNotExist
}


