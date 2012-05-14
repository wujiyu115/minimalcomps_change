package demo.flashcomps
{
	import fl.controls.TextArea;
	
	import flash.display.Sprite;
	
	public class TextAreaDemo extends Sprite
	{
		public function TextAreaDemo()
		{
			 var textArea:TextArea = new TextArea();
			 textArea.htmlText="<font color='red'>Hello,World</font>";
			 addChild(textArea);
 		}
	}
}