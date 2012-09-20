package demo.flashhk
{
	/**
	 * 
	 * Program Name:       TileListDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-20 上午9:41:14
	 */
	import cn.flashk.controls.TileList;
	import cn.flashk.controls.proxy.DataProvider;
	
	import flash.display.Sprite;
	
	public class TileListDemo extends Sprite
	{
		public function TileListDemo()
		{
			super();
			var tileList:TileList= new TileList();
			tileList.dataProvider = new DataProvider([{label:"1",source:drawCicle()},{label:"1",source:drawCicle()}]);
			addChild(tileList);
		}
		public function drawCicle():Sprite
		{
			var mc:Sprite = new Sprite();
			mc.graphics.beginFill(0);
			mc.graphics.drawCircle(10,10,10);
			mc.graphics.endFill();
			return mc;
		}
	}
}