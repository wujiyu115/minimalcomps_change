package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:19:21
	 *
	 */
	import com.bit101.components.RotarySelector;

	import flash.display.Sprite;

	public class RotarySelectorDemo extends Sprite
	{
		public function RotarySelectorDemo()
		{
			var _loc_1:*=new RotarySelector(this, 0, 40, "Options");
			_loc_1.numChoices=5;
		}
	}
}
