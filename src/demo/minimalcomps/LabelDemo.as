package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:11:47
	 * 
	 */
	import com.bit101.components.Label;
	
	import flash.display.Sprite;
	
	public class LabelDemo extends Sprite
	{
		public function LabelDemo()
		{
			new Label(this, 0, 0, "This is a label.");
		}
	}
}