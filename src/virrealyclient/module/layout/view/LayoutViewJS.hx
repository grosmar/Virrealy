package virrealyclient.module.layout.view;

import hex.core.IAnnotationParsable;
import js.html.DivElement;

/**
 * ...
 * @author duke
 */
class LayoutViewJS implements ILayoutView implements IAnnotationParsable
{
	var _layout:DivElement;

	public function new( layout:DivElement ) 
	{
		this._layout = layout;		
	}

	@:isVar public var visible(get, set):Bool;
	
	function get_visible():Bool 
	{
		return visible;
	}
	
	function set_visible(value:Bool):Bool 
	{
		return visible = value;
	}
	
}