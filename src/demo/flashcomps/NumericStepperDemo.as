package demo.flashcomps
{
	import fl.controls.NumericStepper;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class NumericStepperDemo extends Sprite
	{
		public function NumericStepperDemo()
		{
			 var numberic:NumericStepper = new NumericStepper();
			 numberic.minimum=0;
			 numberic.maximum=100;
			 numberic.addEventListener(Event.CHANGE,changeHandler);
			 addChild(numberic);
		}
		
		protected function changeHandler(event:Event):void
		{
			trace((event.target as NumericStepper).value);
		}
	}
}