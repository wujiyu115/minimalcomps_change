package bloom.themes 
{
	import bloom.styles.*;
	import flash.display.BitmapData;
	
	/**
	 * Theme
	 */
	public class Theme implements ITheme {
		
		protected var _alpha:Number = 0.5;
		protected var _plate:BitmapData;
		
		protected var _label:TextStyle;
		protected var _button:ButtonStyle;
		protected var _buttonBase:ButtonBaseStyle;
		protected var _checkBox:CheckBoxStyle;
		protected var _textInput:TextInputStyle;
		protected var _numericStepper:NumericStepperStyle;
		protected var _progressBar:ProgressBarStyle;
		protected var _slider:SliderStyle;
		protected var _textBox:TextBoxStyle;
		protected var _toggleButton:ToggleButtonStyle;
		protected var _container:ContainerStyle;
		protected var _scrollContainer:ScrollContainerStyle;
		protected var _window:WindowStyle;
		protected var _tabBox:TabBoxStyle;
		protected var _accordion:AccordionStyle;
		protected var _list:ListStyle;
		protected var _tree:TreeStyle;
		
		public function Theme() {
			
		}
		
		///////////////////////////////////
		// getter/setters
		///////////////////////////////////
		
		public function get alpha():Number {
			return _alpha;
		}
		
		public function get plate():BitmapData {
			return _plate;
		}
		
		public function get buttonBase():ButtonBaseStyle {
			return _buttonBase;
		}
		
		public function get label():TextStyle {
			return _label;
		}
		
		public function get button():ButtonStyle {
			return _button;
		}
		
		public function get checkBox():CheckBoxStyle {
			return _checkBox;
		}
		
		public function get textInput():TextInputStyle {
			return _textInput;
		}
		
		public function get numericStepper():NumericStepperStyle {
			return _numericStepper;
		}
		
		public function get progressBar():ProgressBarStyle {
			return _progressBar;
		}
		
		public function get slider():SliderStyle {
			return _slider;
		}
		
		public function get textBox():TextBoxStyle {
			return _textBox;
		}
		
		public function get toggleButton():ToggleButtonStyle {
			return _toggleButton;
		}
		
		public function get container():ContainerStyle {
			return _container;
		}
		
		public function get scrollContainer():ScrollContainerStyle {
			return _scrollContainer;
		}
		
		public function get window():WindowStyle {
			return _window;
		}
		
		public function get tabBox():TabBoxStyle {
			return _tabBox;
		}
		
		public function get accordion():AccordionStyle {
			return _accordion;
		}
		
		public function get list():ListStyle {
			return _list;
		}
		
		public function get tree():TreeStyle {
			return _tree;
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		public function toString():String {
			return "[bloom.themes.Theme]";
		}
	}

}