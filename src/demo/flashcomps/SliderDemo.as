package demo.flashcomps
{
	import fl.controls.Slider;
	
	import flash.display.Sprite;
	
	public class SliderDemo extends Sprite
	{
		public function SliderDemo()
		{
			 var slider:Slider =  new Slider();
			 slider.value = 50;
			 addChild(slider);
		}
	}
}