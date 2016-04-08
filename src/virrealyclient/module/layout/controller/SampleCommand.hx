package virrealyclient.module.layout.controller;

import virrealyclient.module.layout.model.ILayoutModel;
import hex.control.Request;
import hex.control.command.BasicCommand;
import hex.di.IInjectorContainer;

/**
 * ...
 * @author duke
 */
class SampleCommand extends BasicCommand implements IInjectorContainer
{
	@Inject
	public var layoutModel:ILayoutModel;

	override public function execute(?request:Request):Void 
	{
		
	}
	
}