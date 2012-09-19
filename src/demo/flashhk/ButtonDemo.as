package demo.flashhk
{
	/**
	 * 
	 * Program Name:       ButtonDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-19 下午8:42:47
	 */
	
	import cn.flashk.controls.Button;
	
	import flash.display.Sprite;
	
	public class ButtonDemo extends Sprite
	{
		public function ButtonDemo()
		{
			 var button:Button =  new Button();
			 button.label="fuck";
			 addChild(button);
		}
	}
}