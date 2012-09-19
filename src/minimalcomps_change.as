package
{

	import com.bit101.components.Component;
	import com.bit101.components.Style;
	
	import demo.MainUiSite;
	
	import flash.display.Sprite;
 
	[SWF(backgroundColor='#ffffff', frameRate='30', width="1366", height="768")]
	public class minimalcomps_change extends Sprite
	{
		
		public function minimalcomps_change()
		{
			Style.embedFonts=false;
			Style.fontName="微软雅黑";
			Style.fontSize=9;
			Component.initStage(stage);
			addChild(new MainUiSite());
		}
	}
}   

