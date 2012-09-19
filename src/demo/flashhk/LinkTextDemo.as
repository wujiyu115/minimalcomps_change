package demo.flashhk
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-9-20 上午1:57:17
	 * 
	 */
	import cn.flashk.controls.LinkText;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class LinkTextDemo extends Sprite
	{
		public function LinkTextDemo()
		{
			 var linktext:LinkText = new LinkText();
			 linktext.label ="Baidu";
			 linktext.linkURL="http://www.baidu.com";
			 addChild(linktext);
		}
	}
}