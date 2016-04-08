package virrealyclient.module.layout.model;
import hex.model.Model;

/**
 * ...
 * @author duke
 */
class LayoutModel extends Model<LayoutModelDispatcher, ILayoutModelListener> implements ILayoutModel
{
	
	public function new() 
	{
		super();
		
		this.dispatcher = new LayoutModelDispatcher();
		
	}
		
}