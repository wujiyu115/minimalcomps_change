package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:32:00
	 * 
	 */
	import com.bit101.charts.PieChart;
	
	import flash.display.Sprite;
	
	public class PieChartDemo extends Sprite
	{
		public function PieChartDemo()
		{
			var _loc_1:* = new Array();
			var _loc_2:int = 0;
			while (_loc_2 < 8)
			{
				
				_loc_1.push({value:Math.random() * 100, label:"Value " + (_loc_2 + 1)});
				_loc_2++;
			}
			_loc_1.sortOn("value", Array.NUMERIC);
			new PieChart(this, 20, 0, _loc_1).setSize(200, 120);
		}
	}
}