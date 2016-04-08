package virrealyclient.module.layout.view;

import virrealyclient.module.layout.model.ILayoutModelListener;
import virrealyclient.module.layout.model.ILayoutModelRO;
import hex.view.viewhelper.ViewHelper;

/**
 * ...
 * @author duke
 */
class LayoutViewHelper extends ViewHelper implements ILayoutModelListener
{
	var _layoutView:ILayoutView;
	
	@Inject
	public var layoutModel:ILayoutModelRO;

	public function new() 
	{
		super();
		
	}
	
	override function _initialize():Void 
	{
		super._initialize();
		
		this._layoutView = cast this._view;
		this.layoutModel.addListener( this );
	}
}