import domkit.Property.InvalidProperty;
import haxe.EnumTools;
import domkit.CssValue;

class MyCustomCSSParser extends h2d.domkit.BaseComponents.CustomParser {
	public function new() {
		super();
	}

	public override function parseTile(v:CssValue) {
		#if macro
		return super.parseTile(v);
		#else
		switch v {
			case VCall("perlin", [VInt(w), VInt(h), VFloat(scale), VIdent(channel)]):
				var p = new hxd.Perlin();
				var seed = 7;
				var bitmapData = new hxd.BitmapData(w, h);
				bitmapData.lock();
				for (y in 0...bitmapData.height)
					for (x in 0...bitmapData.width) {
						var c = p.gradient3D(seed, x*scale/w, y*scale/h, 0);
						var ci = Std.int((hxd.Math.clamp(c)+1.0)/2.0 * 255.0);
						var a = 255;
						var r = 0;
						var g = 0;
						var b = 0;

						switch(channel) {
							case "red": r = ci;
							case "green": g = ci;
							case "blue": b = ci;
							case "all": 
								r = g = b = ci;
							case "alpha": a = ci;
							default: invalidProp('unknown channel ${channel}');
						}
						
						final color = (a << 24) | (r << 16) | (g << 8) | b;
						bitmapData.setPixel(x, y, color);
					}

				bitmapData.unlock();

				var texture = h3d.mat.Texture.fromBitmap(bitmapData);
				return h2d.Tile.fromTexture(texture);

			default:
				return super.parseTile(v);
		}
		#end
	}
		
	public override function parseFont(value:CssValue) {
	
		#if macro
				return super.parseFont(value);
		#else 

		switch value {
			case VCall("myfont",[VIdent(fontId)]):
				
				if (fontId == "m6x11") {
					return hxd.Res.m6x11.toFont();
				} else return invalidProp('unknown font ${fontId}');
			
			default:
				return super.parseFont(value);
		}

		#end
	}
}
