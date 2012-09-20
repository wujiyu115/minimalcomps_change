package demo.flashhk
{
	/**
	 * 
	 * Program Name:       SliderDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-20 上午9:39:24
	 */
	import cn.flashk.controls.Slider;
	
	import flash.display.Sprite;
	
	public class SliderDemo extends Sprite
	{
		public function SliderDemo()
		{
			var _loc_14:Slider = new Slider();
			_loc_14.minSpaceNum = 30;
			_loc_14.snapInterval = 1;
			_loc_14.thumbCount = 2;
			_loc_14.setMotion(1);
			_loc_14.setStyle("sliderUnableColor", "#000000");
			this.addChild(_loc_14);
		}
	}
}