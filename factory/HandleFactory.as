package factory
{
	import factory.handle.HandleCreator;
	import factory.handle.HandleCreatorCircle;
	import factory.handle.HandleCreatorTriangle;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	
	/**
	 * ...
	 * @author jck
	 */
	public class HandleFactory extends Sprite
	{
		private var _handles:Vector.<Sprite>;
		
		public function HandleFactory()
		{
			_handles = new Vector.<Sprite>();
		}
		
		public function createHandles():Vector.<Sprite>
		{
			var coordinates:Vector.<Point> = factory.Main.coordinates;
			var trianglecreator:HandleCreator;
			var circlecreator:HandleCreator;
			var triangle:Sprite;
			var circle:Sprite;
			
			for ( var i:int = 0; i < coordinates.length; i += 2 )
			{
				trianglecreator = new HandleCreatorTriangle();
				circlecreator = new HandleCreatorCircle();
				
				triangle = trianglecreator.doStuff();
				circle = circlecreator.doStuff();
				
				addChild( triangle );
				addChild( circle );
				
				triangle.x = coordinates[ i ].x;
				triangle.y = coordinates[ i ].y;
				triangle.rotation = i * -22;
				circle.x = coordinates[ i + 1 ].x;
				circle.y = coordinates[ i + 1 ].y;
				
				_handles.push( triangle, circle );
			}
			return _handles;
		}
	}
}
