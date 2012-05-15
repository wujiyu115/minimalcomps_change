package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:14:34
	 * 
	 */
	import com.bit101.components.Label;
	import com.bit101.components.Panel;
	
	import flash.display.Sprite;
	
	public class PanelDemo extends Sprite
	{
		public function PanelDemo()
		{
			var _loc_1:* = new Panel(this, 0, 0);
			_loc_1.setSize(300, 200);
			new Label(_loc_1.content, 10, 10, "This is a panel. Other components can go here, such as this label.");
			
		}
	}
}