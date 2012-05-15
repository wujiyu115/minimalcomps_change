package demo.flashcomps
{
	import fl.controls.UIScrollBar;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	public class UIScrollBarDemo extends Sprite
	{
		public function UIScrollBarDemo()
		{
			var myTxt:TextField = new TextField();
			myTxt.border = true;
			myTxt.width = 200;
			myTxt.height = 50;
			myTxt.x = 200;
			myTxt.y = 150;
			
			var mySb:UIScrollBar = new UIScrollBar();
			mySb.direction = "horizontal";
			// Size it to match the text field.
			mySb.setSize(myTxt.width, myTxt.height); 
			
			// Move it immediately below the text field.
			mySb.move(myTxt.x, myTxt.height + myTxt.y);
			
			// put them on the Stage
			addChild(myTxt);
			addChild(mySb);
			// load text
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest("http://blog.sina.com.cn/twocold");
			loader.load(request);
			loader.addEventListener(Event.COMPLETE, loadcomplete);
			
			function loadcomplete(event:Event) {
				// move loaded text to text field
				myTxt.text = loader.data;
				// Set myTxt as target for scroll bar.
				mySb.scrollTarget = myTxt;
			}

		}
	}
}