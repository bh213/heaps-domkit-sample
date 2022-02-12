package screens;
import DomKitApp;

@:uiComp("screen5")
class Screen5Comp extends h2d.Object implements BaseScreen implements h2d.domkit.Object {

    static var SRC =
	<screen5>
		<flow id="id1" class="grid-holder grid-top-1">
			<num(1) >
				<num(2)>
					<num(3)>
						<num(4)/>
					</num>		
				</num>
			</num>
			<selector("#id1 num num num text")/>
		</flow>

		<flow id="id2" class="grid-holder grid-top-2">
			<num(1) >
				<num(2)>
					<num(3)/>
					<num(3)>
						<num(4)/>
					</num>
				</num>
			</num>
			<selector("#id2 > num > num > num > text")/>
		</flow>
		
		<flow id="id3" class="grid-holder grid-top-3">
			<num(1) >
				<num(2)>
					<num(3)/>
					<num(3)/>
				</num>
			</num>
			<selector("#id3 > num > text")/>
		</flow>
		
		<flow id="id4" class="grid-holder grid-mid-1">
			<num(1) >
				<num(2)>
					<num(3)/>
					<num(3)/>
				</num>
			</num>
			<selector("#id4  num  text")/>
		</flow>
		
		<flow id="id5" class="grid-holder grid-mid-2">
			<num(1) >
				<num(2)>
					<num(3)/>
					<num(3)/>
					<num(3)/>
					<num(3)/>
					<tx("A", 3)/>
					<tx("B", 3)/>
					<tx("C", 3)/>
				</num>
			</num>
			<selector("#id5 num num *:even text")/>
		</flow>

		<flow id="id6" class="grid-holder grid-mid-3">
			<tx("A",1) class="A">
				<tx("B",2) class="B">
					<tx("C",3) class="C"/>
					<tx("C",3) class="C"/>
					<tx("C",3) class="C"/>
					<tx("CD",3) class="C D"/>
					<tx("D", 3) class="D"/>
					<tx("C", 3) class="C"/>
					<tx("D", 3) class="D"/>
				</tx>
			</tx>
			<selector("#id6 .A .B .C text")/>
		</flow>

		<flow id="id7" class="grid-holder grid-bot-1">
			<tx("A",1) class="A">
				<tx("B",2) class="B">
					<tx("C",3) class="C"/>
					<tx("C",3) class="C"/>
					<tx("C",3) class="C"/>
					<tx("CD",3) class="C D"/>
					<tx("D", 3) class="D"/>
					<tx("C", 3) class="C"/>
					<tx("D", 3) class="D"/>
				</tx>
			</tx>
			<selector("#id7 .A .B .C.D text")/>
		</flow>
		
		<flow id="id8" class="grid-holder grid-bot-2">
			<tx("A",1) class="A">
				<tx("B",2) class="B">
					<tx("C",3) class="C"/>
					<tx("C",3) class="C"/>
					<tx("C",3) class="C"/>
					<tx("CD",3) class="C D"/>
					<tx("D", 3) class="D"/>
					<tx("C", 3) class="C"/>
					<tx("D", 3) class="D"/>
				</tx>
			</tx>
			<selector("#id8 tx tx .C text")/>
		</flow>
		
		<flow id="id9" class="grid-holder grid-bot-3">
			<tx("A",1) class="A">
				<tx("B",2) class="B">
					<num(3) class="C"/>
					<tx("C",3) class="C"/>
					<tx("C",3) class="C"/>
					<tx("CD",3) class="C D"/>
					<tx("D", 3) class="D"/>
					<tx("C", 3) class="C"/>
					<tx("D", 3) class="D"/>
					<num(3) class="C"/>
				</tx>
			</tx>
			<selector("#id9 tx.C")/>
		</flow>
	</screen5>;

	public function new(?parent) {
		super(parent);
		initComponent();
	}

	
	public function getTitle() {
		return "CSS selectors";
	}
	public function getH2dObject() {
		return this;
	}
}

@:uiComp("num")
class NumMyComponent extends h2d.Flow implements h2d.domkit.Object {
	static var SRC =
	<num>
		<text text={strNum}/>
	</num>;

	public function new(level:Int, ?parent) {
		super(parent);
		var strNum = StringTools.lpad('${level}', "-",level+1);
		initComponent();

	}
}

@:uiComp("tx")
class TxMyComponent extends h2d.Flow implements h2d.domkit.Object {
	static var SRC =
	<tx>
		<text text={str}/>
	</tx>;

	public function new(txt:String, level:Int, ?parent) {
		super(parent);
		var str = StringTools.lpad('${txt}', "-",level+txt.length);
		initComponent();
	}
}


@:uiComp("selector")
class SelectorMyComponent extends h2d.Flow implements h2d.domkit.Object {
	static var SRC =
	<selector>
		<html-text text={t}/>
	</selector>;

	public function new(t:String, ?parent) {
		super(parent);
		initComponent();
	}
}
