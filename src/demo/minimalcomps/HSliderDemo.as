package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:05:22
	 * 
	 */
	import com.bit101.components.HSlider;
	import com.bit101.components.VBox;
	
	import flash.display.Sprite;
	
	public class HSliderDemo extends Sprite
	{
		public function HSliderDemo()
		{
			var _loc_1:VBox = new VBox(this);
			var _loc_2:int = 0;
			while (_loc_2 < 10)
			{
				
				new HSlider(_loc_1, 0, 0).value = Math.random() * 100;
				_loc_2++;
			}
		}
	}
}