
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

## Examples include

* DomKit components
* DomKit component discovery, see [DomKitInit.hx](DomKitInit.hx)
* DomKit CSS filters
* DomKit CSS transitions (scale, rotate)
* adding custom CSS to existing DomKit components (font and tile, see [MyCustomCSSParser.hx](MyCustomCSSParser.hx))
* CSS selectors (#id, .class, componentName)
* CSS pseudo-classes
* dynamically adding and removing components
* styling flows
* documented domkit inspection mode (text at the bottom of the screen)





## Disclaimer

DomKit is not really well documented and is lacking example code (hence this repo) so be aware that code here might not be follow the best practices or could even be completely wrong.

### Attribution

Font m6x11 by [Daniel Linssen](https://managore.itch.io/m6x11)