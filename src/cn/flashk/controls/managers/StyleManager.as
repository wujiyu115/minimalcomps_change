package cn.flashk.controls.managers 
{
	/**
	 * ...
	 * @author flashk
	 */
	public class StyleManager 
	{
		public static var globalWindowDragAlpha:Number = 0.65;
        public static var globalAbleUserResizeWindow:Boolean = true;
        public static var globalWindowAutoClip:Boolean = true;
		public static var globalShowWindowMiniButton:Boolean = true;
        public static var globalTabbarAutoClip:Boolean = true;
        public static var globalTabBarAlign:String = "center";
		/**
		 * 滚动条的缓动值，1表示不使用缓动 
		 */
		public static var globalScrollBarSmoothNum:Number = 3;
		/**
		 * 默认Image是否开启平滑图像显示 
		 */
		public static var globalImageSmoth:Boolean = true;
		/**
		 * 默认是否允许TileList控件使用按下拖拉矩形进行多选 
		 */
		public static var globalTileListAllowMultipleSelection:Boolean = true;
        
		public function StyleManager() 
		{
			
		}
		public static function setThemeGradientMode(value:uint):void {
			ThemesSet.GradientMode = value;
		}
		
	}

}