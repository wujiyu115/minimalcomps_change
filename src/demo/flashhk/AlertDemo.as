package demo.flashhk
{
	/**
	 * 
	 * Program Name:       AlertDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-19 下午8:37:56
	 */
	import cn.flashk.controls.Alert;
	import cn.flashk.controls.events.AlertCloseEvent;
	
	import flash.display.Sprite;
	
	public class AlertDemo extends Sprite
	{
		public function AlertDemo()
		{
			 var alert:Alert = new Alert("hello,world","test",null,["a","b"],closeHandler);
			 addChild(alert);
		}
		public function closeHandler(event:AlertCloseEvent):void
		{
			trace("hello");
		}
	}
}