package demo.bloomcomps
{
	/**
	 * 
	 * Program Name:       TextBoxDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-18 下午9:40:16
	 */
	import flash.display.Sprite;
	import bloom.components.TextBox;
	
	public class TextBoxDemo extends Sprite
	{
		public function TextBoxDemo()
		{
			var textBox:TextBox = new TextBox(this);
			textBox.scrollBar.width = 30;
			textBox.size(200, 100);
		}
	}
}