package demo.minimalcomps
{
	import com.bit101.components.ColorChooser;
	
	import flash.display.Sprite;
	
	public class ColorChooserDemo extends Sprite
	{
		public function ColorChooserDemo()
		{
			var _loc_1:ColorChooser= new ColorChooser(this, 0, 0);
			_loc_1.usePopup = true;
		}
	}
}