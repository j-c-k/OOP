package factory.handle
{
	import flash.display.Sprite;
	import flash.errors.IllegalOperationError;
	import flash.utils.getQualifiedClassName;
	
	/**
	 * Abstract class. Should be subclassed and not instantiated.
	 * @author jck
	 */
	public class HandleCreator extends Sprite
	{
		/**
		 * Abstract Class constructor. Not for construction.
		 */
		public function HandleCreator()
		{
			if ( getQualifiedClassName( this ) == "factory.handle::HandleCreator" )
				throw new IllegalOperationError( "HandleCreator is an abstract class and not meant for instantiation" );
		}
		
		public function doStuff():Sprite
		{
			var handle:IHandle = factoryMethod();
			handle.drawHandle();
			
			return handle as Sprite;
		}
		
		protected function factoryMethod():IHandle
		{
			throw new IllegalOperationError( "Abstract method:  must be overridden in a subclass" );
			return null;
		}
	}
}

