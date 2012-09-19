package demo.flashhk
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-9-20 上午1:54:27
	 * 
	 */
	import cn.flashk.controls.Image;
	
	import flash.display.Sprite;
	
	public class ImageDemo extends Sprite
	{
		public function ImageDemo()
		{
			 var img:Image = new Image();
			 img.source ="assets/button_down.png";
			 addChild(img);
		}
	}
}