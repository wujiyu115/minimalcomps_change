package demo.bloomcomps
{
	/**
	 * 
	 * Program Name:       FlowContainerDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-18 下午7:52:03
	 */
	import flash.display.Sprite;
	import bloom.components.CheckBox;
	import bloom.components.Label;
	import bloom.components.FlowContainer;
	
	public class FlowContainerDemo extends Sprite
	{
		public function FlowContainerDemo()
		{
			var flowContainer:FlowContainer = new FlowContainer(this, FlowContainer.VERTICALLY);
			flowContainer.size(220, 620);
			var label:Label = new Label(flowContainer.content, "BloomLite 1.0");
			var checkBox:CheckBox = new CheckBox(flowContainer.content, "Blue Theme", true);
			flowContainer.update();
		}
	}
}