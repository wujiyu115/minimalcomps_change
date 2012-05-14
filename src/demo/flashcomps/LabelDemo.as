package demo.flashcomps
{
	import fl.controls.Label;
	
	import flash.display.Sprite;
	
	public class LabelDemo extends Sprite
	{
		public function LabelDemo()
		{
			super();
			var lab:Label = new Label();
			lab.text="Hello,World";
			this.addChild(lab);
		}
	}
}