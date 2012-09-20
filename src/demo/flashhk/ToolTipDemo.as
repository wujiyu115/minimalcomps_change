package demo.flashhk
{
	/**
	 * 
	 * Program Name:       ToolTipDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-20 上午9:42:01
	 */
	import cn.flashk.controls.Button;
	import cn.flashk.controls.ToolTip;
	
	import flash.display.Sprite;
	
	public class ToolTipDemo extends Sprite
	{
		public function ToolTipDemo()
		{
			 var button:Button = new Button();
			  button.toolTip ="fuck";
			 addChild(button);
		}
	}
}