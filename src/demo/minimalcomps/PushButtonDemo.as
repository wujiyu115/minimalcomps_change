package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:16:46
	 * 
	 */
	import com.bit101.components.PushButton;
	
	import flash.display.Sprite;
	
	public class PushButtonDemo extends Sprite
	{
		public function PushButtonDemo()
		{
			new PushButton(this, 0, 0, "Regular Button");
			new PushButton(this, 0, 25, "Toggle Button").toggle = true;
		}
	}
}