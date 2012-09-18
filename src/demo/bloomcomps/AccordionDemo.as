package demo.bloomcomps
{
	/**
	 * 
	 * Program Name:       AccordionDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-18 下午6:54:04
	 */
	import flash.display.Sprite;
	import bloom.components.Accordion;
	import bloom.components.AccordionContent;
	import bloom.components.Button;
	
	public class AccordionDemo extends Sprite
	{
		public function AccordionDemo()
		{
			var accordion:Accordion = new Accordion(this);
			accordion.multiSelect = true;
			accordion.move(0, 0);
			
			var accordionContent:AccordionContent = new AccordionContent("Part 0");
			accordionContent.width = 200;
			accordionContent.content.height = 50;
			accordionContent.content.addChild(new Button(null, "Button"));
			accordionContent.content.update();
			accordion.addContent(accordionContent);
			
			var accordionContent1:AccordionContent = new AccordionContent("Part 1");
			accordionContent1.width = 200;
			accordionContent1.content.height = 50;
			accordionContent1.content.addChild(new Button(null, "Button1"));
			accordionContent1.content.update();
			accordion.addContent(accordionContent1);
		}
	}
}