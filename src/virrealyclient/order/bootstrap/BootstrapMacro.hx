package virrealyclient.order.bootstrap;

import hex.control.macro.Macro;
import virrealyclient.order.bootstrap.controller.SetLayoutSettingsCommand;

/**
 * ...
 * @author 
 */
class BootstrapMacro extends Macro
{
	

	public function new() 
	{
		super();
	}
	
	override function _prepare():Void 
	{
		#if debug
		hex.log.Logger.DEBUG("_prepare");
		#end
		
		this.add(SetLayoutSettingsCommand);
	}
	
}