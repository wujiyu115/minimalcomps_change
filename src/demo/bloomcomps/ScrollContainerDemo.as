package demo.bloomcomps
{
	/**
	 * 
	 * Program Name:       ScrollBarDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-18 下午9:19:26
	 */
	import bloom.components.FlowContainer;
	import bloom.components.ScrollBar;
	import bloom.components.ScrollContainer;
	
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	
	public class ScrollContainerDemo extends Sprite
	{
		public function ScrollContainerDemo()
		{
			var scrollContainer:ScrollContainer = new ScrollContainer(this);
			scrollContainer.setScrollBar(true, true);
			scrollContainer.setContentSize(200, 200);
			scrollContainer.getScrollBar(FlowContainer.HORIZONTALLY).height = 30;
			scrollContainer.getScrollBar(FlowContainer.VERTICALLY).width = 30;
		}
	}
}