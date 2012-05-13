package demo.flashcomps
{
	import com.bit101.components.HBox;

	import fl.controls.ColorPicker;
	import fl.controls.Label;
	import fl.events.ColorPickerEvent;

	import flash.display.Sprite;

	public class ColorPickerDemo extends Sprite
	{
		private var label:Label=new Label();

		public function ColorPickerDemo()
		{
			var hbox:HBox=new HBox(this);
			var colorpick:ColorPicker=new ColorPicker();
			colorpick.addEventListener(ColorPickerEvent.CHANGE, changeColorHandler);
			hbox.addChild(label);
			hbox.addChild(colorpick);
		}

		protected function changeColorHandler(event:ColorPickerEvent):void
		{
			label.text=(event.target as ColorPicker).selectedColor.toString();
		}
	}
}
