package demo
{
	import com.bit101.components.PushButton;
	import com.bit101.components.VBox;
	
	import demo.event.CompsEvent;
	import demo.minimalcomps.*;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;

	public class MinimalcompsUI extends VBox
	{
		private var _uiNames:Array=["Accordion", "Calendar", "CheckBox", "ColorChooser", "ComboBox", "FPSMeter", "HBox", "HRangeSlider", "HScrollBar", "HSlider", "HUISlider", "IndicatorLight", "InputText", "Knob", "Label", "List", "Meter", "NumbericStepper", "Panel", "ProgressBar", "PushButton", "RadioButton", "RotarySelector", "ScrollPane", "Text", "TextArea", "VBox", "VRangeSlider", "VScrollBar", "VSlider", "VUISlider", "WheelMenu", "Window", "BarChart", "LineChart", "PieChart","TreeList","MinimalConfigurator"];
		private var classes:Array=[AccordionDemo, CalendarDemo, CheckBoxDemo, ColorChooserDemo, ComboBoxDemo, FPSMeterDemo, HBoxDemo,HRangeSliderDemo, HScrollBarDemo, HSliderDemo, HUISliderDemo, IndicatorLightDemo, InputTextDemo, KnobDemo, LabelDemo, ListDemo, MeterDemo, NumbericStepperDemo, PanelDemo, ProgressBarDemo, PushButtonDemo, RadioButtonDemo, RotarySelectorDemo, ScrollPaneDemo, TextDemo, TextAreaDemo, VBoxDemo, VRangeSliderDemo, VScrollBarDemo, VSliderDemo, VUISliderDemo, WheelMenuDemo, WindowDemo, BarChartDemo, LineChartDemo, PieChartDemo,TreeListDemo,MinimalConfiguratorDemo];

		public function MinimalcompsUI(parent:DisplayObjectContainer)
		{
			super(parent);
		}

		protected override function addChildren():void
		{
			var len:int=_uiNames.length;
			for (var i:int=0; i < len; i++)
			{
				var button:PushButton=new PushButton(this, 0, 0, _uiNames[i]);
			}
			this.addEventListener(MouseEvent.CLICK, clickCompshandler);
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
