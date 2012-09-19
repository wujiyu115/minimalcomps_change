package demo.flashhk
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-9-20 上午1:45:58
	 * 
	 */
	import cn.flashk.controls.ComboBox;
	import cn.flashk.controls.proxy.DataProvider;
	
	import flash.display.Sprite;
	
	public class ComboBoxDemo extends Sprite
	{
		public function ComboBoxDemo()
		{
			 var combo:ComboBox = new ComboBox();
			 combo.dataProvider = new DataProvider([1,2,3]);
			 addChild(combo);
		}
	}
}