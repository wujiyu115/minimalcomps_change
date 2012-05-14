package demo.minimalcomps
{
	import com.bit101.components.ComboBox;
	
	import flash.display.Sprite;
	
	public class ComboBoxDemo extends Sprite
	{
		public function ComboBoxDemo()
		{
			var _loc_1:* = new ComboBox(this, 0, 0, "Choose an item:");
			var _loc_2:int = 0;
			while (_loc_2 < 10)
			{
				
				_loc_1.addItem({label:"Item " + _loc_2.toString(), data:_loc_2});
				_loc_2++;
			}
		}
	}
}