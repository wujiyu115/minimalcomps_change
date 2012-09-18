package demo.bloomcomps
{
	/**
	 * 
	 * Program Name:       IconButtonDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-18 下午7:55:41
	 */
	import bloom.components.IconButton;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	
	public class IconButtonDemo extends Sprite
	{
		public function IconButtonDemo()
		{
			var sp1:Shape = new Shape();
			draw(sp1);
			var sp2:Shape = new Shape();
			draw(sp2,0xffffff);
			var icon:IconButton = new IconButton(this);
			icon.iconNormal=sp1;
			icon.iconOver =sp2;
		}
		public function draw(sp1:Shape,co:uint=0):void
		{
			sp1.graphics.beginFill(co);
			sp1.graphics.drawCircle(10,10,10);
			sp1.graphics.endFill();
		}
	}
}