package demo.flashhk
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-9-20 上午1:37:01
	 *
	 */
	import cn.flashk.controls.ClickAbleAlphaBitmap;

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;

	public class ClickAbleAlphaBitmapDemo  extends Sprite
	{
		[Embed(source="assets/button_down.png")]
		public var PNGset1:Class;

		public function ClickAbleAlphaBitmapDemo()
		{
			var _loc_11:ClickAbleAlphaBitmap=new ClickAbleAlphaBitmap();
			_loc_11.bitmapData=new PNGset1().bitmapData;
			_loc_11.ableHandCursor=true;
			var _loc_12:*=new GlowFilter(16724736, 0.7);
			_loc_11.overFilters=[_loc_12];
			_loc_11.addEventListener(MouseEvent.CLICK, showState);
			this.addChild(_loc_11);

		}

		protected function showState(event:MouseEvent):void
		{

		}
	}
}
