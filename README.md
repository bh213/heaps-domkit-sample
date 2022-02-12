
# Heaps DomKit samples

This repo contains samples for [Heaps](https://github.com/HeapsIO/heaps) [DomKit](https://github.com/HeapsIO/domkit/) components and CSS.


## Live example

Heaps javascript build of this repo is available [here](https://bh213.github.io/heaps-domkit-sample/).

## Building

1) Install [Hashlink](https://github.com/haxeFoundation/hashlink/)
2) Install NodeJS if not present
3) run `npx lix download` to download libraries
4) `haxe hl.hxml`
5) `hl build/domkit-sample.hl`

## Samples

### Screen1
 * DomKit components
 * DomKit classes
 * DomKit filters

### Screen2
 * custom CSS property parsing for h2d.Tile, see `parseTile` in [MyCustomCSSParser.hx](MyCustomCSSParser.hx)
 ```
   src: perlin(64, 64, 5.0, red);
 ```  
### Screen3
* dynamically adding and removing DomKit components
* custom CSS property parsing: fonts, see `parseFont` in [MyCustomCSSParser.hx](MyCustomCSSParser.hx)

```
font:myfont(m6x11);
```

### Screen4
* h2d.Flow based components with various selectors

### Screen5
* DomKit CSS selectors
### Screen6
* CSS selectors and dynamically adding & removing DomKit components

### Screen7
 * `@:uiComp` - DomKit companion classes. Also see them used in Heaps [source code](https://github.com/HeapsIO/heaps/blob/cf1468c74129e575b682577c7cb612bd51ae8090/h2d/domkit/BaseComponents.hx#L645)


## Disclaimer

DomKit is not really well documented and is lacking example code (hence this repo) so be aware that code here might not be follow the best practices or could even be completely wrong.

### Attribution

Font m6x11 by [Daniel Linssen](https://managore.itch.io/m6x11)