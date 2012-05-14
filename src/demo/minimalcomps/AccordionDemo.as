package demo.minimalcomps
{
	import com.bit101.components.*;
	
	import flash.display.Sprite;
	
	public class AccordionDemo extends Sprite
	{
		public function AccordionDemo()
		{
			var acc:Accordion = new Accordion(this, 0, 0);
			acc.addWindow("Section 3");
			acc.addWindow("Section 4");
			acc.addWindow("Section 5");
			acc.setSize(220, 300);
			new Calendar(acc.getWindowAt(0).content, 10, 10);
			new PushButton(acc.getWindowAt(1).content, 10, 10, "Click me");
			new Text(acc.getWindowAt(2).content, 10, 10, "Here is some text");
			new Meter(acc.getWindowAt(3).content, 10, 10, "Impedance");
			new CheckBox(acc.getWindowAt(4).content, 10, 10, "Choice A");
			new CheckBox(acc.getWindowAt(4).content, 10, 30, "Choice B");
			new CheckBox(acc.getWindowAt(4).content, 10, 50, "Choice C");
		}
	}
}