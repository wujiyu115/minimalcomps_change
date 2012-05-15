package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:29:25
	 * 
	 */
	import com.bit101.components.Label;
	import com.bit101.components.Window;
	
	import flash.display.Sprite;
	
	public class WindowDemo extends Sprite
	{
		public function WindowDemo()
		{
			var _loc_1:* = new Window(this, 0, 0, "Normal Window");
			_loc_1.setSize(150, 120);
			new Label(_loc_1.content, 10, 10, "Stuff goes here");
			var _loc_2:* = new Window(this, 200, 0, "Non-Dragging Window");
			_loc_2.setSize(150, 120);
			_loc_2.draggable = false;
			new Label(_loc_2.content, 10, 10, "Stuff goes here");
			var _loc_3:* = new Window(this, 0, 200, "Minimizing Window");
			_loc_3.setSize(150, 120);
			_loc_3.hasMinimizeButton = true;
			new Label(_loc_3.content, 10, 10, "Stuff goes here");
		}
	}
}