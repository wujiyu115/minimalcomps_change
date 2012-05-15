package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:24:58
	 *
	 */
	import com.bit101.components.PushButton;
	import com.bit101.components.VBox;
	import com.bit101.components.VSlider;
	
	import flash.display.Sprite;
	import flash.events.Event;

	public class VBoxDemo extends Sprite
	{
		private var vbox:VBox;
		private var slider:VSlider;

		public function VBoxDemo()
		{
			this.vbox=new VBox(this);
			new PushButton(this.vbox, 0, 0, "One");
			new PushButton(this.vbox, 0, 0, "Two");
			new PushButton(this.vbox, 0, 0, "Three");
			this.slider=new VSlider(this, 120, 0, this.onChange);
			this.slider.maximum=50;
			this.slider.value=5;
			return;
		}

		private function onChange(event:Event):void
		{
			this.vbox.spacing=this.slider.value;
			return;
		}
	}
}
