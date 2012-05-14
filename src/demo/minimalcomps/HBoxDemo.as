package demo.minimalcomps
{
	import com.bit101.components.HBox;
	import com.bit101.components.HSlider;
	import com.bit101.components.PushButton;
	
	import flash.display.Sprite;
	import flash.events.Event;

	public class HBoxDemo extends Sprite
	{
		private var hbox:HBox;
		private var slider:HSlider;

		public function HBoxDemo()
		{
			this.hbox=new HBox(this);
			new PushButton(this.hbox, 0, 0, "One");
			new PushButton(this.hbox, 0, 0, "Two");
			new PushButton(this.hbox, 0, 0, "Three");
			this.slider=new HSlider(this, 0, 50, this.onChange);
			this.slider.maximum=50;
			this.slider.value=5;
		}

		private function onChange(event:Event):void
		{
			this.hbox.spacing=this.slider.value;
		}
	}
}
