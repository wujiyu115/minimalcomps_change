package demo.flashhk
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-9-20 上午1:50:31
	 * 
	 */
	import cn.flashk.controls.DataGrid;
	import cn.flashk.controls.proxy.DataProvider;
	
	import flash.display.Sprite;
	
	public class DataGridDemo extends Sprite
	{
		public function DataGridDemo()
		{
		  var dtatgrid:DataGrid = new DataGrid();
		  dtatgrid.dataProvider=new DataProvider([[1,2,3,4],[1,2,3,4]]);
		  addChild(dtatgrid);
		}
	}
}