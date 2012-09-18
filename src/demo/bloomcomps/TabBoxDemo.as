package demo.bloomcomps
{
	/**
	 * 
	 * Program Name:       TabBoxDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-18 下午9:39:02
	 */
	import bloom.components.Button;
	import bloom.components.CheckBox;
	import bloom.components.TabBox;
	import bloom.components.TabBoxContent;
	import bloom.components.ToggleButton;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	public class TabBoxDemo extends Sprite
	{
		public function TabBoxDemo()
		{
			var tabBox:TabBox = new TabBox(this);
			tabBox.size(300, 100);
			
			var tabBoxContent:TabBoxContent = new TabBoxContent("Part 0");
			tabBoxContent.content.addChild(new Button(null, "Button"));
			tabBoxContent.content.update();
			tabBox.addContent(tabBoxContent);
			
			tabBoxContent = new TabBoxContent("Part 1");
			tabBoxContent.content.addChild(new CheckBox(null, "CheckBox"));
			tabBoxContent.content.update();
			tabBox.addContent(tabBoxContent);
			
			tabBoxContent = new TabBoxContent("Part 2");
			tabBoxContent.title.icon = new Bitmap(new BitmapData(10, 10, false, 0xffff00));
			tabBoxContent.content.addChild(new ToggleButton(null, "ToggleButton"));
			tabBoxContent.content.update();
			tabBox.addContent(tabBoxContent);
			
			tabBox.header.update();
		}
	}
}