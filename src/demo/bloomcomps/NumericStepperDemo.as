package demo.bloomcomps
{
	/**
	 * 
	 * Program Name:       NumericStepperDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-18 下午8:21:52
	 */
	import bloom.components.NumericStepper;
	
	import flash.display.Sprite;
	
	public class NumericStepperDemo extends Sprite
	{
		public function NumericStepperDemo()
		{
			var num:NumericStepper = new NumericStepper(this,3,0,100);
			num.step=1;
		}
	}
}