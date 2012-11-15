package cn.flashk.controls.managers
{
	import cn.flashk.controls.skin.SkinThemeColor;
	import cn.flashk.conversion.ColorConversion;
	
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.filters.GlowFilter;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	import flash.utils.getDefinitionByName;

	public class SkinLoader
	{
		public static const eventDispatcher:EventDispatcher = new EventDispatcher();
		public static var isSelfFile:Boolean = false;
		private static var ldr:Loader;
		
		public function SkinLoader()
		{
		}
		public static function loadSkinFile(path:String,bytes:ByteArray=null,context:LoaderContext=null):void{
			ldr = new Loader();
			ldr.contentLoaderInfo.addEventListener(Event.COMPLETE,initSkinSet);
            if(bytes== null)
            {
			    ldr.load(new URLRequest(path),context);
            }else
            {
                ldr.loadBytes(bytes,context);
            }
		}
		public static function getClassFromSkinFile(name:String):Class{
			try{
				if(isSelfFile == false){
					return ldr.contentLoaderInfo.applicationDomain.getDefinition(name) as Class;
				}
				return getDefinitionByName(name) as Class;
			}catch(e:Error){
				
			}
			return null;
		}
		public static function getBitmapData(name:String):BitmapData{
			var classRef:Class;
			try{
				if(isSelfFile == false){
					classRef =  ldr.contentLoaderInfo.applicationDomain.getDefinition(name) as Class;
				}else{
					classRef =  getDefinitionByName(name) as Class;
				}
				var dis:DisplayObject = new classRef() as DisplayObject;
				var bd:BitmapData = new BitmapData(dis.width,dis.height,true,0);
				bd.draw(dis);
				return bd;
			}catch(e:Error){
				
			}
			return null;
		}
		public static function setSkinStyle(xml:XML):void{
			DefaultStyle.buttonOutTextColor = xml.buttonTextColor;
			DefaultStyle.buttonOverTextColor = xml.buttonOverTextColor;
			DefaultStyle.buttonDownTextColor = xml.buttonPressTextColor;
			DefaultStyle.menuBackgroundColor = xml.menuBackgroundColor;
//			DefaultStyle.
			SkinThemeColor.itemOverTextColor = ColorConversion.transformWebColor(xml.itemOverTextColor);
			SkinThemeColor.border = ColorConversion.transformWebColor(xml.borderColor);
			
			var obj:Object = ldr.content;
//			DefaultStyle.buttonTextFilters = obj.buttonTextFilters;
			
//			DefaultStyle.buttonTextFilters = [ new GlowFilter(0,1,2,2,5,1)];
		}
		protected static function initSkinSet(event:Event):void
		{
            initSWFSkinSet(ldr);
        }
        public static function initSWFSkinSet(loader:Loader):void
        {
			SkinManager.isUseDefaultSkin = false;
            ldr = loader;
			var obj:Object = loader.content;
			var xml:XML = obj.skinSet as XML;
			setSkinStyle(xml);
			eventDispatcher.dispatchEvent(new Event("skinLoaded"));
			isSelfFile = false;
		}
	}
}