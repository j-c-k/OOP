package factory.handle
{
	
	/**
	 * ...
	 * @author jck
	 */
	public class HandleCreatorCircle extends HandleCreator
	{
		public function HandleCreatorCircle()
		{
		}
		
		override protected function factoryMethod():IHandle
		{
			return new CircleHandle();
		}
	}
}
