package factory
{
	import factory.HandleFactory;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	 * Main class for create couple of handles using factory design pattern.
	 * @author jck
	 */
	public class Main extends Sprite
	{
		private var hfactory:HandleFactory;
		private var handles:Vector.<Sprite>;
		private static var _coordinates:Vector.<Point> = new <Point>[ new Point( 50, 20 ), 
																	new Point( 50, 40 ), 
																	new Point( 50, 60 ), 
																	new Point( 50, 80 ), 
																	new Point( 50, 100 ), 
																	new Point( 50, 120 )/*, 
																	new Point( 50, 140 ), 
																	new Point( 50, 160 ), 
																	new Point( 50, 180 ), 
																	new Point( 50, 200 )*/ ];
		
		public function Main()
		{
			hfactory = new HandleFactory();
			addChild( hfactory );
			
			handles = hfactory.createHandles();
		}
		
		static public function get coordinates():Vector.<Point>
		{
			return _coordinates;
		}
	}
}
