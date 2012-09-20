package demo.flashhk
{
	/**
	 * 
	 * Program Name:       NumericStepperDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-20 上午9:26:22
	 */
	import cn.flashk.controls.NumericStepper;
	
	import flash.display.Sprite;
	
	public class NumericStepperDemo extends Sprite
	{
		public function NumericStepperDemo()
		{
			 var num:NumericStepper = new NumericStepper();
			 num.minimum=1;
			 num.maximum=100;
			 num.value = 20;
			 num.stepSize=2;
			 addChild(num);
		}
	}
}