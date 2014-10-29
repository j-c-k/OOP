package factory.handle
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author jck
	 */
	public class CircleHandle extends Sprite implements IHandle
	{
		private var _bgcolor:uint;
		private var _bgalpha:Number;
		private var _currenttarget:Sprite;
		
		public function CircleHandle()
		{
			_bgcolor = 0xFFAA2A;
			_bgalpha = 0.2;
			
			buttonMode = true;
			addEventListener( MouseEvent.MOUSE_DOWN, onDown );
		}
		
		public function drawHandle():void
		{
			graphics.clear();
			graphics.beginFill( _bgcolor, _bgalpha );
			graphics.lineStyle( 1, _bgcolor );
			graphics.drawCircle( 0, 0, 4 );
			graphics.endFill();
		}
		
		protected function onDown( aEvent:MouseEvent ):void
		{
			_currenttarget = aEvent.currentTarget as Sprite;
			
			stage.addEventListener( MouseEvent.MOUSE_UP, endDrag );
			_currenttarget.addEventListener( MouseEvent.MOUSE_MOVE, onMove );
			
			_currenttarget.startDrag( false );
		}
		
		protected function onMove( aEvent:MouseEvent ):void
		{
		}
		
		protected function endDrag( aEvent:MouseEvent ):void
		{
			_currenttarget.stopDrag();
			
			stage.removeEventListener( MouseEvent.MOUSE_UP, arguments.callee );
			_currenttarget.removeEventListener( MouseEvent.MOUSE_MOVE, onMove );
		}
	}
}
