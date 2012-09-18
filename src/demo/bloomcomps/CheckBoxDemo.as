package demo.bloomcomps
{
	/**
	 * 
	 * Program Name:       CheckBoxDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-18 下午7:42:54
	 */
	import flash.display.Sprite;
	import bloom.components.CheckBox;
	
	public class CheckBoxDemo extends Sprite
	{
		public function CheckBoxDemo()
		{
			var checkBox:CheckBox = new CheckBox(this, "Blue Theme", true);
			checkBox.valueChanged.add(function(target:CheckBox):void {
				target.title.text = target.value ? "Blue Theme" : "Black and white Theme";
			});
		}
	}
}