package screens;
import h2d.Text;
import DomKitApp;
import screens.Screen5Comp;
@:uiComp("screen6")
class Screen6Comp extends h2d.Object implements BaseScreen implements h2d.domkit.Object {

    static var SRC =
	<screen6>
	<flow id="id10" class="grid-holder grid-top-1">
	<button("add <num(4)> at the end") id="addNumButton10"/>
	<button("remove first <num(4)>") id="delNumButton10"/>
	<selector('#id10 num num num num:even text<br/>and :odd<br/> dynamic adding/removing <font color="#f00">NOT</font> supported at the moment')/>
		<num(1) >
			<num(2)>
				<num(3) id="parent10">
					<num(4)/>
					<num(4)/>
					<num(4)/>
					<num(4)/>
				</num>		
			</num>
		</num>
	</flow>

	<flow id="id11" class="grid-holder grid-top-2">
		<button("add <num(4)> subtree") id="addNumButton11"/>
		<selector("#id11 num num text")/>
		<num(1) id="parent11">
					<num(4)/>
					<num(4)/>
					<num(4)/>
					<num(4)/>
			
		</num>
		
		
	</flow>

	<flow id="id12" class="grid-holder grid-top-3">
	<button("add <num(2)> to manually added h2d.Layers ") id="addNumButton12"/>
	<selector("#id12 num")/>
		<num(1) id="parent12">
		</num>
	</flow>
	</screen6>;

	public function new(?parent) {
		super(parent);
		
		
		
		initComponent();
		
		
		addNumButton10.onClick = () -> {
			parent10.addChild(new NumMyComponent(4));
		}
		delNumButton10.onClick = () -> {
			for (c in parent10.getChildren()) {
				if (Std.isOfType(c, NumMyComponent)) {
					c.remove();
					return;
				}
			}
		}
		addNumButton11.onClick = () -> {
			var subtree = new NumMyComponent(4);
			subtree.addChild(new NumMyComponent(5));
			subtree.addChild(new NumMyComponent(5));
			parent11.addChild(subtree);
		}

		var layers = new h2d.Layers(parent12);
		addNumButton12.onClick = () -> {
			var n = new NumMyComponent(2);
			n.y = layers.getBounds().height;
			layers.addChild(n);
			
			
		}
	}

	
	public function getTitle() {
		return "CSS and dynamic adding/removing components";
	}
	public function getH2dObject() {
		return this;
	}
}

