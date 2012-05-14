package demo.minimalcomps
{
	import com.bit101.components.FPSMeter;
	
	import flash.display.Sprite;
	
	public class FPSMeterDemo extends Sprite
	{
		public function FPSMeterDemo()
		{
			new FPSMeter(this, 0, 0).start();
		}
	}
}