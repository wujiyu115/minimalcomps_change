package demo.flashhk
{
	/**
	 * 
	 * Program Name:       TextInputDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-20 上午9:41:01
	 */
	import cn.flashk.controls.TextInput;
	
	import flash.display.Sprite;
	
	public class TextInputDemo extends Sprite
	{
		public function TextInputDemo()
		{
			 var textinput:TextInput = new TextInput();
			 textinput.text ="Enter Name";
			 addChild(textinput);
		}
	}
}