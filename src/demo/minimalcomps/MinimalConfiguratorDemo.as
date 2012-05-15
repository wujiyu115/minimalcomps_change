package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:52:34
	 * 
	 */
	import com.bit101.components.Label;
	import com.bit101.utils.MinimalConfigurator;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class MinimalConfiguratorDemo extends Sprite
	{
		public function MinimalConfiguratorDemo()
		{
			//使用xml来配置
			var xml:XML=<comps>
					<Label id="myLabel" x="10" y="200" text="waiting..."/>
					<PushButton x="10" y="240" label="click me" event="click:onClick"/>
				</comps>;
			var config:MinimalConfigurator=new MinimalConfigurator(this);
			config.parseXML(xml);
		}
		public var myLabel:Label;
		
		public function onClick(event:MouseEvent):void
		{
			myLabel.text="You did it";
		}
	}
}