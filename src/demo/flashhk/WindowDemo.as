package demo.flashhk
{
	/**
	 * 
	 * Program Name:       WindowDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-20 上午9:42:18
	 */
	import cn.flashk.controls.Window;
	
	import flash.display.Sprite;
	
	public class WindowDemo extends Sprite
	{
		public function WindowDemo()
		{
			super();
			var win:Window = new Window();
			addChild(win);
		}
	}
}