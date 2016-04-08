package virrealyclient.module.layout;

import hex.config.stateless.StatelessCommandConfig;
import hex.config.stateless.StatelessModelConfig;
import hex.module.Module;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;
import virrealyclient.module.layout.controller.SampleCommand;
import virrealyclient.module.layout.message.LayoutModuleMessage;
import virrealyclient.module.layout.model.ILayoutModel;
import virrealyclient.module.layout.model.LayoutModel;
import virrealyclient.module.layout.view.ILayoutView;
import virrealyclient.module.layout.view.LayoutViewHelper;

/**
 * ...
 * @author duke
 */
class LayoutModule extends Module implements ILayoutModule
{

	public function new(layoutView:ILayoutView) 
	{
		super();
		
		this._addStatelessConfigClasses([LayoutCommandConfig, LayoutModelConfig]);
		
		this.setLayoutView( layoutView );
	}
	
	override function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd = new RuntimeDependencies();
		return rd;
	}
	
	function setLayoutView( layoutView:ILayoutView ):Void
	{
		this.buildViewHelper( LayoutViewHelper, layoutView );
	}
	
}

private class LayoutCommandConfig extends StatelessCommandConfig
{
	override public function configure():Void
	{
		this.map( LayoutModuleMessage.SAMPLE, SampleCommand );
	}
}

private class LayoutModelConfig extends StatelessModelConfig
{
	override public function configure() : Void
	{
		this.mapModel( ILayoutModel, LayoutModel );
	}
}