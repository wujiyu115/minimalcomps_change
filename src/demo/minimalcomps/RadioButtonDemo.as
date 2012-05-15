package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:17:09
	 *
	 */
	import com.bit101.components.Label;
	import com.bit101.components.RadioButton;
	import com.bit101.components.VBox;

	import flash.display.Sprite;

	public class RadioButtonDemo extends Sprite
	{
		public function RadioButtonDemo()
		{
			new Label(this, 0, 0, "Radio Button Group A");
			var _loc_1:*=new VBox(this, 10, 30);
			new RadioButton(_loc_1, 0, 0, "Option 1");
			new RadioButton(_loc_1, 0, 0, "Option 2");
			new RadioButton(_loc_1, 0, 0, "Option 3");
			new RadioButton(_loc_1, 0, 0, "Option 4");
			new Label(this, 150, 0, "Radio Button Group B");
			var _loc_2:*=new VBox(this, 160, 30);
			new RadioButton(_loc_2, 0, 0, "Choice 1").groupName="groupB";
			new RadioButton(_loc_2, 0, 0, "Choice 2").groupName="groupB";
			new RadioButton(_loc_2, 0, 0, "Choice 3").groupName="groupB";
		}
	}
}
