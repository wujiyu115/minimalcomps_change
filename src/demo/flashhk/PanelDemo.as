package demo.flashhk
{
	/**
	 * 
	 * Program Name:       PanelDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-20 上午9:31:05
	 */
	import cn.flashk.controls.Button;
	import cn.flashk.controls.Panel;
	
	import flash.display.Sprite;
	
	public class PanelDemo extends Sprite
	{
		public function PanelDemo()
		{
			 var panel:Panel = new Panel();
			 panel.addChild(new Button());
			 addChild(panel);
		}
	}
}