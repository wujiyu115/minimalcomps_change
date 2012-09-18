package demo
{
	import bloom.core.ThemeBase;
	import bloom.themes.BlueTheme;
	import bloom.themes.Theme;
	
	import com.bit101.components.PushButton;
	import com.bit101.components.VBox;
	
	import demo.bloomcomps.AccordionDemo;
	import demo.bloomcomps.ButtonDemo;
	import demo.bloomcomps.CheckBoxDemo;
	import demo.bloomcomps.ColorPickerDemo;
	import demo.bloomcomps.ContainerDemo;
	import demo.bloomcomps.FlowContainerDemo;
	import demo.bloomcomps.IconButtonDemo;
	import demo.bloomcomps.LabelDemo;
	import demo.bloomcomps.ListDemo;
	import demo.bloomcomps.NumericStepperDemo;
	import demo.bloomcomps.ProgressBarDemo;
	import demo.bloomcomps.ScrollContainerDemo;
	import demo.bloomcomps.SliderDemo;
	import demo.bloomcomps.TabBoxDemo;
	import demo.bloomcomps.TextBoxDemo;
	import demo.bloomcomps.TextInputDemo;
	import demo.bloomcomps.ToggleButtonDemo;
	import demo.bloomcomps.TreeDemo;
	import demo.bloomcomps.WindowDemo;
	import demo.event.CompsEvent;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * 
	 * Program Name:       BloomUI
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-18 下午6:04:52
	 */
	public class BloomUI extends VBox
	{
		private var _uiNames:Array=["Accordion", "Button","CheckBox","ColorPicker","Container","FlowContainer","IconButton","Label","List","NumericStepper","ProgressBar","ScrollContainer","Slider","TabBox","TextBox","TextInput","ToggleButton","TreeDemo","Window"];
		private var classes:Array=[AccordionDemo,ButtonDemo,CheckBoxDemo,ColorPickerDemo,ContainerDemo,FlowContainerDemo,IconButtonDemo,LabelDemo,ListDemo,NumericStepperDemo,ProgressBarDemo,ScrollContainerDemo,SliderDemo,TabBoxDemo,TextBoxDemo,TextInputDemo,ToggleButtonDemo,TreeDemo,WindowDemo];

		public function BloomUI(parent:DisplayObjectContainer)
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
			var blue:Theme = new BlueTheme();
			ThemeBase.initialize(stage);
			ThemeBase.theme = blue;			
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