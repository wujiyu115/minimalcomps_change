package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:12:22
	 * 
	 */
	import com.bit101.components.List;
	
	import flash.display.Sprite;
	
	public class ListDemo extends Sprite
	{
		public function ListDemo()
		{
			var _loc_1:* = new Array();
			var _loc_2:* = new List(this, 0, 0);
			var _loc_3:int = 0;
			while (_loc_3 < 1000)
			{
				
				_loc_2.addItem("Item " + _loc_3.toString());
				_loc_3++;
			}
			_loc_2.setSize(100, 200);
		}
	}
}