import screens.*;


@:uiComp("domkitRoot")
// Naming scheme of component classes can be customized with domkit.Macros.registerComponentsPath();
class DomkitRootComp extends h2d.Object implements h2d.domkit.Object {

	static var SRC =
	<domkitRoot>
		<text id="titleText"/>
		${screens}
		<text id="helpText" text={"Press ALT + middle mouse to enter inspection mode\nALT+mouse wheel to select parents\nCTRL+ALT+middle click for component tree"}/>

		<button("prev") id="prevButton"/>
		<button("next") id="nextButton"/>
	</domkitRoot>;

	var screens:Array<BaseScreen> = [];
	var currentScreenIndex = 0;
	public function new(?parent) {
		super(parent);

		screens.push(new Screen1Comp(this));
		screens.push(new Screen2Comp(this));
		screens.push(new Screen3Comp(this));
		screens.push(new Screen4Comp(this));
		initComponent();
		updateScreens();
		
		nextButton.onClick = () -> {
			currentScreenIndex = (currentScreenIndex + 1) % screens.length;
			updateScreens();
		}
		prevButton.onClick = () -> {
			currentScreenIndex = (currentScreenIndex + screens.length - 1) % screens.length;
			updateScreens();
		}
	}

	function updateScreens() {
		for (i in 0...screens.length) {
			screens[i].getH2dObject().visible = i == currentScreenIndex;
		}
		titleText.text = 'Screen ${currentScreenIndex+1}: ${screens[currentScreenIndex].getTitle()}';
	}
}


@:uiComp("button")
class ButtonComp extends h2d.Flow implements h2d.domkit.Object {

	static var SRC = <button>
		<text public id="buttonText" />
	</button>

	public var label(get, set): String;
	function get_label() return buttonText.text;
	function set_label(s) {
		buttonText.text = s;
		return s;
	}

	// All parameters must be typed in domkit component constructors
	public function new(text:String, ?parent ) {
		super(parent);
		initComponent();
		label = text;
		enableInteractive = true;
		interactive.onClick = function(_) onClick();
		interactive.onOver = (e)->dom.hover = true;
		interactive.onPush = (e)->dom.active = true;
		interactive.onRelease = (e)->dom.active = false;
		interactive.onOut = (e)->dom.hover = false;
	}

	public dynamic function onClick() {
	}
}



class DomKitApp extends hxd.App {
	
	var style = null;

	override function init() {

		var root = new DomkitRootComp();
		s2d.add(root);
		style = new h2d.domkit.Style();
		style.load(hxd.Res.style);
		style.addObject(root);
		style.allowInspect = true;	
		// Press ALT + middle button for domkit inspection		
		style.inspectKeyCode = hxd.Key.ALT;			
		

	

	}


	override function update(dt:Float) {
		style.sync();
	}

	static function main() {
		#if hl
		hxd.res.Resource.LIVE_UPDATE = true;
		hxd.Res.initLocal();
		#else
		hxd.Res.initEmbed();
		#end
		new DomKitApp();
	}

}