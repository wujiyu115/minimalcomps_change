package bloom.components 
{
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextFieldType;
	import flash.utils.Timer;
	
	import org.osflash.signals.natives.NativeSignal;
	import org.osflash.signals.Signal;
	
	import bloom.core.Component;
	import bloom.core.TextBase;
	import bloom.core.ThemeBase;
	import bloom.styles.NumericStepperStyle;
	
	/**
	 * NumericStepper
	 */
	public class NumericStepper extends Component {
		
		public var step:Number = 2;
		
		private var _value:Number;
		private var _max:Number;
		private var _min:Number;
		
		private var _increasing:Boolean;
		private var _timer:Timer;
		
		private var _increase:IconButton;
		private var _decrease:IconButton;
		
		private var _textBase:TextBase;
		
		private var background:BitmapData;
		
		private var active:Boolean = false;
		
		private var _valueChanged:Signal;
		private var _mouseWheel:NativeSignal;
		private var _timerTick:NativeSignal;
		
		public function NumericStepper(p:DisplayObjectContainer = null, value:Number = 0, max:Number = 100, min:Number = -100) {
			super(p);
			_max = max;
			_min = min;
			
			_increase = new IconButton(this);
			_increase.mouseDown.add(onIncreasePress);
			_increase.mouseClick.add(onIncreaseClick);
			_decrease = new IconButton(this);
			_decrease.mouseDown.add(onDecreasePress);
			_decrease.mouseClick.add(onDecreaseClick);
			
			_textBase = new TextBase(this);
			_textBase.selectable = true;
			_textBase.multiline = false;
			_textBase.type = TextFieldType.INPUT;
			_textBase.restrict = "0-9.\\-";
			_textBase.onTextChanged.add(onTextChanged);
			_textBase.onFocusedIn.add(onFocusedIn);
			_textBase.onFocusedOut.add(onFocusedOut);
			
			_timer = new Timer(1000);
			_timerTick = new NativeSignal(_timer, TimerEvent.TIMER, TimerEvent);
			_timerTick.add(onTimerTick);
			
			_mouseWheel = new NativeSignal(this, MouseEvent.MOUSE_WHEEL, MouseEvent);
			_mouseWheel.add(onMouseWheel);
			
			_valueChanged = new Signal(NumericStepper);
			
			this.value = value;
			
			_style = ThemeBase.theme.numericStepper;
			size(100, 20);
		}
		
		override public function dispose():void {
			super.dispose();
			if (background) background.dispose();
			background = null;
			
			ThemeBase.onStageMouseUp.remove(onMouseUp);
			
			_increase.dispose();
			_increase = null;
			_decrease.dispose();
			_decrease = null;
			_textBase.dispose();
			_textBase = null;
			
			_mouseWheel.removeAll();
			_mouseWheel = null;
			_valueChanged.removeAll();
			_valueChanged = null;
			_timerTick.removeAll();
			_timerTick = null;
			
			_timer.reset();
			_timer.stop();
			_timer = null;
		}
		
		private function onMouseWheel(e:MouseEvent):void {
			value += (e.delta > 0 ? 1 : -1) * step;
		}
		
		private function onTextChanged(e:Event):void {
			if (Number(_textBase.text) is Number && !isNaN(Number(_textBase.text))) {
				value = Number(_textBase.text);
			} else {
				_textBase.text = value.toString();
			}
		}
		
		private function onTimerTick(e:TimerEvent):void {
			_timer.delay = 100;
			value += _increasing ? step : -step;
		}
		
		private function onIncreaseClick(e:MouseEvent):void {
			value += step;
		}
		
		private function onDecreaseClick(e:MouseEvent):void {
			value -= step;
		}
		
		private function onIncreasePress(e:MouseEvent):void {
			_increasing = true;
			_timer.reset();
			_timer.start();
			ThemeBase.onStageMouseUp.addOnce(onMouseUp);
		}
		
		private function onDecreasePress(e:MouseEvent):void {
			_increasing = false;
			_timer.reset();
			_timer.start();
			ThemeBase.onStageMouseUp.addOnce(onMouseUp);
		}
		
		private function onMouseUp(e:MouseEvent):void {
			_timer.stop();
			_timer.delay = 1000;
		}
		
		override protected function onThemeChanged():void {
			if (!_lock) style = ThemeBase.theme.numericStepper;
		}
		
		override protected function draw(e:Event):void {
			if (!_changed) return;
			_changed = false;
			
			var style:NumericStepperStyle = _style as NumericStepperStyle;
			if (background) background.dispose();
			
			_increase.style = style.increase;
			_decrease.style = style.decrease;
			
			_increase.x = _decrease.x = _width - _height;
			_increase.width = _decrease.width = _height;
			_increase.height = _decrease.height = _decrease.y = _height * 0.5;
			
			graphics.clear();
			if (active) {
				_textBase.style = style.text_active;
				style.active.setSize(_width - _height, _height);
				background = style.active.bitmapData.clone();
			} else {
				_textBase.style = style.text_normal;
				style.normal.setSize(_width - _height, _height);
				background = style.normal.bitmapData.clone();
			}
			graphics.beginBitmapFill(background);
			graphics.drawRect(0, 0, _width - _height, _height);
			graphics.endFill();
			
			_textBase.size(_width - _height, _height);
		}
		
		protected function fixValue():void {
			if (_max > _min) {
				if (_value > _max)_value = _max;
				if (_value < _min)_value = _min;
			} else {
				_value = _min = _max;
			}
			_textBase.text = String(_value);
			_valueChanged.dispatch(this);
		}
		
		private function onFocusedIn(e:FocusEvent):void {
			active = true;
			_changed = true;
			invalidate();
		}
		
		private function onFocusedOut(e:FocusEvent):void {
			active = false;
			_changed = true;
			invalidate();
		}
		
		///////////////////////////////////
		// getter/setters
		///////////////////////////////////
		
		override public function set enabled(value:Boolean):void {
			if (_enabled != value) {
				_textBase.tabEnabled = _enabled = mouseEnabled = mouseChildren = value;
				alpha = _enabled ? 1 : ThemeBase.theme.alpha;
			}
		}
		
		public function get textBase():TextBase {
			return _textBase;
		}
		
		public function get increase():IconButton {
			return _increase;
		}
		
		public function get decrease():IconButton {
			return _decrease;
		}
		
		public function set value(value:Number):void {
			if (_value != value) {
				_value = value;
				fixValue();
			}
		}
		
		public function get value():Number {
			return _value;
		}
		
		public function set max(value:Number):void {
			if (_max != value) {
				_max = value;
				fixValue();
			}
		}
		
		public function get max():Number {
			return _max;
		}
		
		public function set min(value:Number):void {
			if (_min != value) {
				_min = value;
				fixValue();
			}
		}
		
		public function get min():Number {
			return _min;
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		override public function toString():String {
			return "[bloom.components.NumericStepper]";
		}
		
	}

}