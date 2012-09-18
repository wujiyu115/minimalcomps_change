package bloom.components 
{
	import flash.display.DisplayObjectContainer;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	
	import bloom.core.TextBase;
	import bloom.core.ThemeBase;
	
	/**
	 * Label
	 */
	public class Label extends TextBase {
		
		public function Label(p:DisplayObjectContainer = null, text:String = "") {
			super(p);
			
			type = TextFieldType.DYNAMIC;
			autoSize = TextFieldAutoSize.LEFT;
			
			selectable = mouseEnabled = tabEnabled = false;
			
			this.text = text;
			
			style = ThemeBase.theme.label;
		}
		
		override protected function onThemeChanged():void {
			if (!_lock) style = ThemeBase.theme.label;
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		override public function toString():String {
			return "[bloom.components.Label]";
		}
		
	}

}