package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:15:34
	 * 
	 */
	import com.bit101.components.ProgressBar;
	import com.bit101.components.PushButton;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class ProgressBarDemo extends Sprite
	{
		private var pb:ProgressBar;
		private var progress:Number = 0;
		private var timer:Timer;
		
		public function ProgressBarDemo()
		{
			this.pb = new ProgressBar(this, 0, 0);
			this.timer = new Timer(100, 100);
			this.timer.addEventListener(TimerEvent.TIMER, this.onTimer);
			this.timer.start();
			new PushButton(this, 0, 20, "Reset", this.onReset);
			return;
		}// end function
		
		private function onTimer(event:TimerEvent) : void
		{
			this.progress = this.progress + 0.01;
			this.pb.value = this.progress;
			return;
		}// end function
		
		private function onReset(event:MouseEvent) : void
		{
			this.progress = 0;
			this.timer.reset();
			this.timer.start();
			return;
		}// end function

	}
}