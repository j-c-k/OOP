package factory.handle
{
	
	/**
	 * ...
	 * @author jck
	 */
	public class HandleCreatorTriangle extends HandleCreator
	{
		public function HandleCreatorTriangle()
		{
		}
		
		override protected function factoryMethod():IHandle
		{
			return new TriangleHandle();
		}
	}
}
