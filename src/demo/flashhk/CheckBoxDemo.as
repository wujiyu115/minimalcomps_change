package demo.flashhk
{
	/**
	 * 
	 * Program Name:       CheckBoxDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-19 下午8:44:11
	 */
	import cn.flashk.controls.CheckBox;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class CheckBoxDemo extends Sprite
	{
		public function CheckBoxDemo()
		{
			var ck:CheckBox = new CheckBox();
			ck.x = 150;
			ck.y = 53;
			ck.label = "按钮使用内发光效果";
			ck.selected = true;
			ck.setSize(130, 21);
			this.addChild(ck);
		}
	}
}