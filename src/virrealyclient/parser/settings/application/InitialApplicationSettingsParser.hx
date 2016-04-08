package virrealyclient.parser.settings.application;

import hex.data.IParser;
import virrealyclient.vo.settings.application.InitialApplicationSettingsVO;

/**
 * ...
 * @author duke
 */
class InitialApplicationSettingsParser implements IParser
{

	public function new() 
	{
		
	}
	
	public function parseSettings( settings:Dynamic ):InitialApplicationSettingsVO
	{
		return cast this.parse(settings);
	}
	
	public function parse(serializedContent:Dynamic, target:Dynamic = null):Dynamic 
	{
		var data:Dynamic = serializedContent;
		
		var result = new InitialApplicationSettingsVO();
		
		result.rootElementId = data.rootElementId;
		
		return result;
	}
	
	
}