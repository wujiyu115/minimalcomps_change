package demo.bloomcomps
{
	/**
	 * 
	 * Program Name:       ListDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-18 下午8:17:37
	 */
	import bloom.components.List;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	
	public class ListDemo extends Sprite
	{
		public function ListDemo()
		{
			var sp1:Shape = new Shape();
			 draw(sp1);
			 var list:List = new List(this,[[1,sp1],[1,sp1],[1,sp1],[1,sp1],[1,sp1]]);
		}
		public function draw(sp1:Shape,co:uint=0):void
		{
			sp1.graphics.beginFill(co);
			sp1.graphics.drawCircle(10,10,10);
			sp1.graphics.endFill();
		}
	}
}