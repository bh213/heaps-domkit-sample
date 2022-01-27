
import MyCustomCSSParser;

class DomKitInit {
    
    public static function setup() {
        // Enables my custom parser
        domkit.Macros.setDefaultParser("MyCustomCSSParser");
        // maps dom components. e.g. <nested> would look for NestedComp (default domkit config) OR NestedMyComponent
        domkit.Macros.registerComponentsPath("$MyComponent");
        domkit.Macros.registerComponentsPath("screens.$Comp");
        
        
        
    }
}