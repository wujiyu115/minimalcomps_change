package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:28:38
	 * 
	 */
	import com.bit101.components.Label;
	import com.bit101.components.WheelMenu;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class WheelMenuDemo extends Sprite
	{
		private var wm:WheelMenu;
		
		public function WheelMenuDemo()
		{
			new Label(this, 0, 0, "Click anywhere.");
			this.wm = new WheelMenu(this, 5);
			this.wm.setItem(0, "One");
			this.wm.setItem(1, "Two");
			this.wm.setItem(2, "Three");
			this.wm.setItem(3, "Four");
			this.wm.setItem(4, "Five");
			addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
			return;
		}// end function
		
		private function onAddedToStage(event:Event) : void
		{
			stage.addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
			addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
			return;
		}// end function
		
		private function onRemovedFromStage(event:Event) : void
		{
			stage.removeEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
			removeEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
			return;
		}// end function
		
		private function onMouseDown(event:MouseEvent) : void
		{
			this.wm.show();
			return;
		}// end function
	}
}