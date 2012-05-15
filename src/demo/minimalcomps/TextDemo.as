package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:23:51
	 * 
	 */
	import com.bit101.components.Text;
	
	import flash.display.Sprite;
	
	public class TextDemo extends Sprite
	{
		public function TextDemo()
		{
			var _loc_1:* = new Text(this, 0, 0);
			_loc_1.text = "This is a Text component, used to display a block of static or editable text. Currently, scroll bars are not implemented.";
			
		}
	}
}