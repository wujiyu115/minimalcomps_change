package bloom.themes.blue
{
	import flash.geom.Rectangle;
	
	import bloom.core.ScaleBitmap;
	import bloom.styles.ButtonBaseStyle;
	
	/**
	 * BlueButtonBase
	 */
	public class BlueButtonBase extends ButtonBaseStyle {
		
		[Embed(source="assets/button_normal.png")]
		private static var bm0:Class;
		
		[Embed(source="assets/button_over.png")]
		private static var bm1:Class;
		
		[Embed(source="assets/button_down.png")]
		private static var bm2:Class;
		
		public function BlueButtonBase() {
			normal = new ScaleBitmap(new bm0().bitmapData);
			normal.scale9Grid = new Rectangle(15, 15, 70, 14);
			over = new ScaleBitmap(new bm1().bitmapData);
			over.scale9Grid = new Rectangle(15, 15, 70, 14);
			down = new ScaleBitmap(new bm2().bitmapData);
			down.scale9Grid = new Rectangle(15, 15, 70, 14);
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		override public function toString():String {
			return "[bloom.themes.blue.BlueButtonBase]";
		}
		
	}

}