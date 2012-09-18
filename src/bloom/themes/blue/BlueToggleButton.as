package bloom.themes.blue 
{
	import flash.geom.Rectangle;
	
	import bloom.core.ScaleBitmap;
	import bloom.styles.TextStyle;
	import bloom.styles.ToggleButtonStyle;
	
	/**
	 * BlueToggleButton
	 */
	public class BlueToggleButton extends ToggleButtonStyle {
		
		[Embed(source="assets/button_normal.png")]
		private static var bm0:Class;
		
		[Embed(source="assets/button_down.png")]
		private static var bm1:Class;
		
		public function BlueToggleButton() {
			title_normal = new TextStyle();
			title_normal.textFormat.font = "Verdana";
			title_normal.textFormat.size = 12;
			title_normal.textFormat.color = 0xffffff;
			
			title_active = new TextStyle();
			title_active.textFormat.font = "Verdana";
			title_active.textFormat.size = 12;
			title_active.textFormat.color = 0x000000;
			
			normal = new ScaleBitmap(new bm0().bitmapData);
			normal.scale9Grid = new Rectangle(15, 15, 70, 14);
			active = new ScaleBitmap(new bm1().bitmapData);
			active.scale9Grid = new Rectangle(15, 15, 70, 14);
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		override public function toString():String {
			return "[bloom.themes.blue.BlueToggleButton]";
		}
	}

}