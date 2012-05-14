package demo.flashcomps
{
	import com.bit101.components.VBox;
	
	import fl.controls.TextInput;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class TextInputDemo extends Sprite
	{
		private var textinput:TextInput = new TextInput();
		private var textinput1:TextInput = new TextInput();
		public function TextInputDemo()
		{
			 textinput.addEventListener(KeyboardEvent.KEY_UP,key_upHandler);
			 var vbox:VBox = new VBox(this);
			 vbox.addChild(textinput);
			 vbox.addChild(textinput1);
		}
		
		protected function key_upHandler(event:KeyboardEvent):void
		{
			textinput1.text = textinput.text;
		}
	}
}