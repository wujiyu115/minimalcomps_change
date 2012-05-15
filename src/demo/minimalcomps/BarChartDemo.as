package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:29:53
	 * 
	 */
	import com.bit101.charts.BarChart;
	
	import flash.display.Sprite;
	
	public class BarChartDemo extends Sprite
	{
		public function BarChartDemo()
		{
			var _loc_1:* = new Array();
			var _loc_2:int = 0;
			while (_loc_2 < 50)
			{
				
				_loc_1.push(Math.random() * 100);
				_loc_2++;
			}
			new BarChart(this, 20, 0, _loc_1).showScaleLabels = true;
		}
	}
}