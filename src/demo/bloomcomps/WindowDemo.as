package demo.bloomcomps
{
	/**
	 * 
	 * Program Name:       WindowDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-18 下午9:49:29
	 */
	import bloom.components.Button;
	import bloom.components.FlowContainer;
	import bloom.components.Label;
	import bloom.components.List;
	import bloom.components.ScrollContainer;
	import bloom.components.Window;
	import bloom.core.ScaleBitmap;
	import bloom.styles.ContainerStyle;
	
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class WindowDemo extends Sprite
	{
		public function WindowDemo() {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event=null):void
		{
			stage.showDefaultContextMenu = false;
			stage.scaleMode = "noScale";
			stage.align = "TL";
			
			
			var style:ContainerStyle = new ContainerStyle();
			style.background = new ScaleBitmap(new BitmapData(1, 1, false, 0xCCCCCC));
			
			//var flow:FlowContainer = new FlowContainer(null, FlowContainer.VERTICALLY);
			//flow.style = style;
			
			var flow:ScrollContainer = new ScrollContainer(null, FlowContainer.VERTICALLY);
			flow.lock = true;
			flow.margin.reset(0, 8, 0, 8);
			
			flow.content.addChild(new Label(null, "Label"));
			flow.content.addChild(new Button(null, "Button"));
			flow.content.addChild(new Button(null, "Button"));
			flow.content.addChild(new Button(null, "Button"));
			flow.content.addChild(new Button(null, "Button"));
			flow.content.addChild(new Button(null, "Button"));
			flow.content.addChild(new Button(null, "Button"));
			flow.update();
			
			flow.setScrollBar(true, true);
			flow.setContentSize(200, flow.content.height + 30);
			
			var window:Window = new Window(this, flow);
			window.header.content.addChild(new Label(null, "Window"));
			window.header.update();
			window.liveResize = true;
			window.minWidth = 200;
			window.minHeight = 200;
			window.move(220, 10);
			window.size(200, 200);
			
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0x0066ff);
			shape.graphics.drawRect(0, 0, 10, 10);
			shape.graphics.endFill();
			
			var data:Array = [["0", null], ["1", null], ["2", shape], ["3", null], ["4", null], ["5", null], ["6", null], ["7", null], ["8", null]];
			
			var list:List = new List(this, data);
			list.getScrollBar(FlowContainer.VERTICALLY).width = 30;
			//list.autoScale = false;
			//list.contentHeight = 40;
			//list.contentWidth = 120;
			//list.contentMargin.reset(5, 5, 5, 5);
			list.group.index = 2;
			list.size(200, 100);
			list.move(10, 10);
		}
	}
}