package bloom.components 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	
	import bloom.core.ThemeBase;
	import bloom.styles.ToggleButtonStyle;
	
	/**
	 * ToggleButton
	 */
	public class ToggleButton extends CheckBox {
		
		protected var _icon:DisplayObject;
		
		public function ToggleButton(p:DisplayObjectContainer=null, title:String="", value:Boolean=false) {
			super(p, title, value);
			style = ThemeBase.theme.toggleButton;
			size(120, 30);
		}
		
		override protected function onTitleChanged(e:Event):void {
			if (_icon) {
				_icon.x = (_width - _icon.width - _title.margin.left - _title.width) * 0.5;
				_icon.y = (_height - _icon.height) * 0.5;
				_title.x = _icon.x + _icon.width + _title.margin.left;
			} else {
				_title.x = (_width - _title.width) * 0.5;
			}
			_title.y = (_height - _title.height) * 0.5;
		}
		
		override public function dispose():void {
			super.dispose();
			if (_icon) {
				if (_icon.parent) removeChild(_icon);
				_icon = null;
			}
		}
		
		override protected function onThemeChanged():void {
			if (!_lock) style = ThemeBase.theme.toggleButton;
		}
		
		override protected function draw(e:Event):void {
			if (!_changed) return;
			_changed = false;
			
			var style:ToggleButtonStyle = _style as ToggleButtonStyle;
			if (background) background.dispose();
			
			graphics.clear();
			if (_value) {
				title.style = style.title_active;
				style.active.setSize(_width, _height);
				background = style.active.bitmapData.clone();
			} else {
				title.style = style.title_normal;
				style.normal.setSize(_width, _height);
				background = style.normal.bitmapData.clone();
			}
			graphics.beginBitmapFill(background);
			graphics.drawRect(0, 0, _width, _height);
			graphics.endFill();
			
			onTitleChanged(null);
		}
		
		///////////////////////////////////
		// getter/setters
		///////////////////////////////////
		
		public function get icon():DisplayObject {
			return _icon;
		}
		
		public function set icon(value:DisplayObject):void {
			if (_icon != value) {
				if (_icon) removeChild(_icon);
				_icon = value;
				if (_icon) {
					addChild(_icon);
					onTitleChanged(null);
				}
			}
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		public override function toString():String {
			return "[bloom.components.ToggleButton]";
		}
		
	}

}