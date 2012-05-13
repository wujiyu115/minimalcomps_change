package demo.flashcomps
{
	import com.bit101.components.HBox;
	
	import fl.controls.CheckBox;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class CheckBoxDemo extends Sprite
	{
		public function CheckBoxDemo()
		{
			var hbox:HBox = new HBox(this);
			 var checkbox1:CheckBox = new CheckBox();
			 checkbox1.label="first";
			 var checkbox2:CheckBox = new CheckBox();
			 checkbox2.label="second";
			 hbox.addChild(checkbox1);
			 hbox.addChild(checkbox2);
			 
			 checkbox1.addEventListener(MouseEvent.CLICK,clickHandler);
			 
		}
		
		protected function clickHandler(event:MouseEvent):void
		{
			trace((event.target as CheckBox).selected);
		}
	}
}