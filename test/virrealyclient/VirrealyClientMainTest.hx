package virrealyclient;
import hex.unittest.notifier.BrowserUnitTestNotifier;
import hex.unittest.notifier.ConsoleNotifier;
import hex.unittest.runner.ExMachinaUnitCore;

/**
 * ...
 * @author duke
 */
class VirrealyClientMainTest
{

	static public function main() : Void
	{
		var emu = new ExMachinaUnitCore();
		
		#if js
		emu.addListener( new ConsoleNotifier( false ) );
		emu.addListener( new BrowserUnitTestNotifier( "console" ) );
		#end
		
		emu.addTest( VirrealyClientSuite );
		emu.run();

	}
	
}