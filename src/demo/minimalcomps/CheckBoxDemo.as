package demo.minimalcomps
{
	import com.bit101.components.CheckBox;
	
	import flash.display.Sprite;
	
	public class CheckBoxDemo extends Sprite
	{
		public function CheckBoxDemo()
		{
			new CheckBox(this, 0, 10, "Item 1");
			new CheckBox(this, 0, 35, "Item 2");
			new CheckBox(this, 0, 60, "Item 3");
			new CheckBox(this, 0, 85, "Item 4");
		}
	}
}