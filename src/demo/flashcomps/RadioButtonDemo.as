package demo.flashcomps
{
	import com.bit101.components.HBox;
	
	import fl.controls.RadioButton;
	import fl.controls.RadioButtonGroup;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class RadioButtonDemo extends Sprite
	{
		public function RadioButtonDemo()
		{
			var hbox:HBox=new HBox(this);
			var group:RadioButtonGroup=new RadioButtonGroup("group1");
			var rad1:RadioButton=new RadioButton();
			var rad2:RadioButton=new RadioButton();
			rad1.label="爱";
			rad2.label="情";
			rad1.group=group;
			rad2.group=group;
			hbox.addChild(rad1);
			hbox.addChild(rad2);
			group.addEventListener(MouseEvent.CLICK,clickhandler);

		}
		
		protected function clickhandler(event:MouseEvent):void
		{
			trace((event.target as RadioButtonGroup).selection.toString());
		}
	}
}
