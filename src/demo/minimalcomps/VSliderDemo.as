package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:27:41
	 * 
	 */
	import com.bit101.components.HBox;
	import com.bit101.components.VSlider;
	
	import flash.display.Sprite;
	
	public class VSliderDemo extends Sprite
	{
		public function VSliderDemo()
		{
			var _loc_1:* = new HBox(this);
			var _loc_2:int = 0;
			while (_loc_2 < 10)
			{
				
				new VSlider(_loc_1, 0, 0).value = Math.random() * 100;
				_loc_2++;
			}
		}
	}
}