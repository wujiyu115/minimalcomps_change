package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:07:45
	 * 
	 */
	import com.bit101.components.InputText;
	
	import flash.display.Sprite;
	
	public class InputTextDemo extends Sprite
	{
		public function InputTextDemo()
		{
			new InputText(this, 0, 0, "Type here...");
		}
	}
}