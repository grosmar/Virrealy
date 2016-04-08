package virrealyclient.module.layout.model;
/**
 * @author duke
 */

interface ILayoutModelRO 
{
	
	function addListener( listener : ILayoutModelListener ):Void;

	function removeListener( listener : ILayoutModelListener ):Void;
	
}