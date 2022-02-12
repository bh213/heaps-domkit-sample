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
		<rect width="50" height="50" color="red"/>
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

class Rectange extends h2d.Object {
	var graphics:h2d.Graphics;
	@:p public var width(default, set):Int;
	@:p public var height(default, set):Int;
	@:p public var color(default, set):Int;
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

	function set_color(color:Int):Int {
		this.color = color;
		redraw = true;
		return this.color;
	}
	
	public function new(?parent) {
		super(parent);
		graphics = new h2d.Graphics(parent);
		width = 100;
		height = 100;
		color = 0xffffffff;
		redraw = true;
	}

	public function update() {
		graphics.clear();
		graphics.setColor(color);
		graphics.beginFill(color, 1);
		graphics.drawRect(0,0, width, height);
		graphics.endFill();
		redraw = false;
	}

	override function sync(ctx) {
		super.sync(ctx);
		if (redraw ) update();
	}
}

@:uiComp("rect")  @:domkitDecl
class RectMyComponent implements h2d.domkit.Object implements domkit.Component.ComponentDecl<Rectange>{
	@:p var width : Int;
	@:p var height : Int;
	@:p(color) var color : Int;
	//@:p var doesNotExist:Int; screens.Rectangle has no field doesNotExist
}


