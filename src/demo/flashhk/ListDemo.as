package demo.flashhk
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-9-20 上午1:58:52
	 * 
	 */
	import cn.flashk.controls.List;
	import cn.flashk.controls.proxy.DataProvider;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class ListDemo extends Sprite
	{
		public function ListDemo()
		{
			super();
			var list:List = new  List();
			list.dataProvider =new DataProvider([1,2,3,4]);
			addChild(list);
		}
	}
}