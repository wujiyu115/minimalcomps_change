package demo.flashcomps
{
	import fl.controls.Button;
	
	import flash.display.Sprite;
	
	public class ButtonDemo extends Sprite
	{
		public function ButtonDemo()
		{
			 var  button:Button = new Button();
			 button.label="Hello,world";
			 addChild(button);
		}
	}
}