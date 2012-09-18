package bloom.themes.blue 
{
	import flash.geom.Rectangle;
	
	import bloom.core.ScaleBitmap;
	import bloom.styles.CheckBoxStyle;
	import bloom.styles.TextStyle;
	
	/**
	 * BlueCheckBox
	 */
	public class BlueCheckBox extends CheckBoxStyle {
		
		[Embed(source="assets/checkbox_off.png")]
		private static var bm0:Class;
		
		[Embed(source="assets/checkbox_on.png")]
		private static var bm1:Class;
		
		public function BlueCheckBox() {
			title_normal = new TextStyle();
			title_normal.textFormat.font = "Verdana";
			title_normal.textFormat.size = 12;
			title_normal.textFormat.color = 0x666666;
			
			title_checked = new TextStyle();
			title_checked.textFormat.font = "Verdana";
			title_checked.textFormat.size = 12;
			title_checked.textFormat.color = 0x000000;
			
			normal = new ScaleBitmap(new bm0().bitmapData);
			normal.scale9Grid = new Rectangle(10, 10, 2, 2);
			checked = new ScaleBitmap(new bm1().bitmapData);
			checked.scale9Grid = new Rectangle(10, 10, 2, 2);
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		override public function toString():String {
			return "[bloom.themes.blue.BlueCheckBox]";
		}
		
	}

}