package demo
{
	import cn.flashk.controls.LinkText;
	import cn.flashk.controls.MenuBar;
	
	import com.bit101.components.PushButton;
	import com.bit101.components.VBox;
	
	import demo.event.CompsEvent;
	import demo.flashhk.AccordionDemo;
	import demo.flashhk.AlertDemo;
	import demo.flashhk.ButtonDemo;
	import demo.flashhk.CheckBoxDemo;
	import demo.flashhk.ClickAbleAlphaBitmapDemo;
	import demo.flashhk.ColorPickerPanelDemo;
	import demo.flashhk.ComboBoxDemo;
	import demo.flashhk.DataGridDemo;
	import demo.flashhk.ImageDemo;
	import demo.flashhk.LinkTextDemo;
	import demo.flashhk.ListDemo;
	import demo.flashhk.MenuBarDemo;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * 
	 * Program Name:       FlashKUI
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-19 下午2:15:10
	 */
	public class FlashKUI extends VBox
	{
		private var _uiNames:Array=["Accordion","Alert", "Button","CheckBox","ColorPickerPanel","ClickAbleAlphaBitmap","ComboBox","DataGrid","Image","LinkText","List","MenuBar","ProgressBar","ScrollContainer","Slider","TabBox","TextBox","TextInput","ToggleButton","TreeDemo","Window"];
		private var classes:Array=[AccordionDemo,AlertDemo,ButtonDemo,CheckBoxDemo,ColorPickerPanelDemo,ClickAbleAlphaBitmapDemo,ComboBoxDemo,DataGridDemo,ImageDemo,LinkTextDemo,ListDemo,MenuBarDemo];
		
		public function FlashKUI(parent:DisplayObjectContainer)
		{
			super(parent, 0, 0);
		}
		
		protected override function addChildren():void
		{
			
			addEventListener(Event.ADDED_TO_STAGE,addToStageHandler);
			var len:int=_uiNames.length;
			for (var i:int=0; i < len; i++)
			{
				var button:PushButton=new PushButton(this, 0, 0, _uiNames[i]);
			}
			this.addEventListener(MouseEvent.CLICK, clickCompshandler);
		}
		
		protected function addToStageHandler(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,addToStageHandler);
		}		
		
		protected function clickCompshandler(event:MouseEvent):void
		{
			var obj:Object=event.target;
			if (obj && obj is PushButton)
			{
				var labname:String=(obj as PushButton).label;
				var index:int=_uiNames.indexOf(labname);
				if (index != -1 && classes[index])
				{
					dispatchEvent(new CompsEvent(CompsEvent.COMPSNAME, classes[index]));
				}
			}
		}
	}
}