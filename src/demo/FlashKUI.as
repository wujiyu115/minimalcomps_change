package demo
{
	import cn.flashk.controls.managers.SkinLoader;
	import cn.flashk.controls.skin.SkinThemeColor;
	
	import com.bit101.components.PushButton;
	import com.bit101.components.VBox;
	
	import demo.event.CompsEvent;
	import demo.flashhk.AccordionDemo;
	import demo.flashhk.AlertDemo;
	import demo.flashhk.ButtonDemo;
	import demo.flashhk.CheckBoxDemo;
	import demo.flashhk.ClickAbleAlphaBitmapDemo;
	import demo.flashhk.ComboBoxDemo;
	import demo.flashhk.DataGridDemo;
	import demo.flashhk.ImageDemo;
	import demo.flashhk.LinkTextDemo;
	import demo.flashhk.ListDemo;
	import demo.flashhk.MenuBarDemo;
	import demo.flashhk.NumericStepperDemo;
	import demo.flashhk.PanelDemo;
	import demo.flashhk.RadioButtonDemo;
	import demo.flashhk.SliderDemo;
	import demo.flashhk.TabBarDemo;
	import demo.flashhk.TextAreaDemo;
	import demo.flashhk.TextInputDemo;
	import demo.flashhk.TileListDemo;
	import demo.flashhk.ToggleButtonDemo;
	import demo.flashhk.ToolRadioButtonDemo;
	import demo.flashhk.ToolTipDemo;
	import demo.flashhk.WindowDemo;
	
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
		private var _uiNames:Array=["Accordion","Alert", "Button","CheckBox","ClickAbleAlphaBitmap","ComboBox","DataGrid","Image","LinkText","List","MenuBar","NumericStepper","Panel","RadioButton","Slider","TabBar","TextArea","TextInput","TileList","ToggleButton","ToolRadioButton","ToolTip","Window"];
		private var classes:Array=[AccordionDemo,AlertDemo,ButtonDemo,CheckBoxDemo,ClickAbleAlphaBitmapDemo,ComboBoxDemo,DataGridDemo,ImageDemo,LinkTextDemo,ListDemo,MenuBarDemo,NumericStepperDemo,PanelDemo,RadioButtonDemo,SliderDemo,TabBarDemo,TextAreaDemo,TextInputDemo,TileListDemo,ToggleButtonDemo,ToolRadioButtonDemo,ToolTipDemo,WindowDemo];
		
		public function FlashKUI(parent:DisplayObjectContainer)
		{
			super(parent, 0, 0);
		}
		
		protected override function addChildren():void
		{
			SkinLoader.loadSkinFile("assets/UISkin.swf");
			SkinLoader.eventDispatcher.addEventListener("skinLoaded", initChildren);
			addEventListener(Event.ADDED_TO_STAGE,addToStageHandler);
			var len:int=_uiNames.length;
			for (var i:int=0; i < len; i++)
			{
				var button:PushButton=new PushButton(this, 0, 0, _uiNames[i]);
			}
		}
		
		private function initChildren(event:Event):void{
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