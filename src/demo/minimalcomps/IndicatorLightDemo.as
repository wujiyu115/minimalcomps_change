package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:07:01
	 * 
	 */
	import com.bit101.components.IndicatorLight;
	
	import flash.display.Sprite;
	
	public class IndicatorLightDemo extends Sprite
	{
		public function IndicatorLightDemo()
		{
			new IndicatorLight(this, 0, 0, 16711680, "On").isLit = true;
			new IndicatorLight(this, 0, 20, 16711680, "Off");
			new IndicatorLight(this, 0, 40, 65280, "Any Color").isLit = true;
			new IndicatorLight(this, 0, 60, 16711680, "Flashing").flash();
		}
	}
}