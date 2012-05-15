package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:12:47
	 *
	 */
	import com.bit101.components.*;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class MeterDemo extends Sprite
	{
		private var meter:Meter;

		public function MeterDemo()
		{
			this.meter=new Meter(this, 0, 0, "Voltage");
			var _loc_1:*=new PushButton(this, 50, 110, "Change", this.onChange);
		}

		protected function onChange(event:MouseEvent):void
		{
			this.meter.value=Math.random();
		} // 
	}
}
