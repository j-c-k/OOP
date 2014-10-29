package factory.handle
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author jck
	 */
	public class TriangleHandle extends Sprite implements IHandle
	{
		private var _bgcolor:uint;
		private var _bgalpha:Number;
		private var _vertices:Vector.<Number>;
		private var _currenttarget:Sprite;
		
		public function TriangleHandle()
		{
			_bgcolor = 0xFFAA2A;
			_bgalpha = .2;
			_vertices = new Vector.<Number>();
			
			buttonMode = true;
			addEventListener( MouseEvent.MOUSE_DOWN, onDown );
			
			_vertices.push( -5,-5, 5,-5, 0,5 );
		}
		
		public function drawHandle():void
		{
			graphics.clear();
			graphics.beginFill( _bgcolor, _bgalpha );
			graphics.lineStyle( 1, _bgcolor );
			graphics.drawTriangles( _vertices );
			graphics.endFill();
		}
		
		protected function onDown( event:MouseEvent ):void
		{
			_currenttarget = event.currentTarget as Sprite;
			
			stage.addEventListener( MouseEvent.MOUSE_UP, endDrag );
			_currenttarget.addEventListener( MouseEvent.MOUSE_MOVE, move );
			
			_currenttarget.startDrag( false );
		}
		
		protected function move( event:MouseEvent ):void
		{
		}
		
		protected function endDrag( event:MouseEvent ):void
		{
			_currenttarget.stopDrag();
			
			stage.removeEventListener( MouseEvent.MOUSE_UP, arguments.callee );
			_currenttarget.removeEventListener( MouseEvent.MOUSE_MOVE, move );
		}
	
	}
}
