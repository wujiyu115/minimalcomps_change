package demo.flashcomps
{
	import fl.containers.UILoader;
	
	import flash.display.Sprite;
	
	public class UILoaderDemo extends Sprite
	{
		public function UILoaderDemo()
		{
			   var uiload:UILoader = new UILoader();
			   uiload.source = "http://www.xncat.com/wp-content/uploads/9ria.jpg";
			   addChild(uiload);
		}
	}
}