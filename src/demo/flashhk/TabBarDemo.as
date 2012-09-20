package demo.flashhk
{
	/**
	 * 
	 * Program Name:       TabBarDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-20 上午9:40:30
	 */
	import cn.flashk.controls.Button;
	import cn.flashk.controls.TabBar;
	
	import flash.display.Sprite;
	
	public class TabBarDemo extends Sprite
	{
		public function TabBarDemo()
		{
			var _loc_13:TabBar = new TabBar();
			_loc_13.alphaHideNum = 0.2;
			_loc_13.align = "left";
			_loc_13.addTab("我的", new Button(), null, true);
			_loc_13.addTab("你得你得你得", new Button(), null, true);
			_loc_13.addTab("色板", new Button(), null, true);
			_loc_13.addTab("样式", new Button(), null, true);
			_loc_13.setSize(440, 150);
			addChild(_loc_13);
		}
	}
}