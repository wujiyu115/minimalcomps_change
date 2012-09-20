package demo.flashhk
{
	/**
	 * 
	 * Program Name:       RadioButtonDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-20 上午9:32:29
	 */
	import cn.flashk.controls.RadioButton;
	import cn.flashk.controls.support.RadioButtonGroup;
	
	import flash.display.Sprite;
	
	public class RadioButtonDemo extends Sprite
	{
		public function RadioButtonDemo()
		{
			super();
			var ragr:RadioButtonGroup = new RadioButtonGroup("sele");
			var raido:RadioButton = new RadioButton();
			raido.label = "hi";
			var raido1:RadioButton = new RadioButton();
			raido1.label = "hello";
			raido1.y =30;
			ragr.addRadioButton(raido);
			ragr.addRadioButton(raido1);
			addChild(raido);
			addChild(raido1);
		}
	}
}