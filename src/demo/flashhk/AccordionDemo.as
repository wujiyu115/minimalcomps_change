package demo.flashhk
{
	/**
	 * 
	 * Program Name:       AccordionDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-19 下午8:24:01
	 */
	import cn.flashk.controls.Accordion;
	import cn.flashk.controls.Button;
	
	import flash.display.Sprite;
	
	public class AccordionDemo extends Sprite
	{
		public function AccordionDemo()
		{
			  var accord:Accordion = new Accordion();
			  accord.add("ac1",new Button());
			  accord.add("ac2",new Button());
			  addChild(accord);
		}
	}
}