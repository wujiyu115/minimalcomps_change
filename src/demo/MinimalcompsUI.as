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
		private var _uiNames:Array=["Accordion", "Calendar", "CheckBox", "ColorChooser", "Component", "FPSMeter", "HBox", "HRangeSlider", "HScrollBar", "HSlider", "HUISlider", "IndicatorLight", "InputText", "Knob", "Label", "List", "Meter", "NumbericStepper", "Panel", "ProgressBar", "PushButton", "RadioButton", "RangeSlider", "RotarySelector", "ScrollBar", "ScrollPane", "Slider", "Text", "TextArea", "UISlider", "VBox", "VRangeSlider", "VScrollBar", "VSlider", "VUISlider", "WheelMenu", "Window", "BarChart", "LineChart", "PieChart"];
		private var classes:Array=[AccordionDemo, CalendarDemo, CheckBoxDemo, ColorChooserDemo, ComboBoxDemo, FPSMeterDemo, HBoxDemo, "HRangeSlider", "HScrollBar", "HSlider", "HUISlider", "IndicatorLight", "InputText", "Knob", "Label", "List", "Meter", "NumbericStepper", "Panel", "ProgressBar", "PushButton", "RadioButton", "RangeSlider", "RotarySelector", "ScrollBar", "ScrollPane", "Slider", "Text", "TextArea", "UISlider", "VBox", "VRangeSlider", "VScrollBar", "VSlider", "VUISlider", "WheelMenu", "Window", "BarChart", "LineChart", "PieChart"];

		public function MinimalcompsUI(parent:DisplayObjectContainer)
		{
			super(parent);
		}

		protected override function addChildren():void
		{
			var len:int=_uiNames.length;
			trace(len);
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
