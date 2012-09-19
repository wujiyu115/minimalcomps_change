package demo.flashhk
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-9-20 上午2:00:54
	 * 
	 */
	import cn.flashk.controls.MenuBar;
	
	import flash.display.Sprite;
	
	public class MenuBarDemo extends Sprite
	{
		public function MenuBarDemo()
		{
			var _loc_2:* = new MenuBar();
			this.addChild(_loc_2);
			var mbXM:XML = <menu>
								<menuitem label="文件" data="top">
									<menuitem label="新建　　　　　　Ctrl+N" data="new" icon="IconS1"/>
									<menuitem label="打开　　　　　　Ctrl+O" data="open"/>
									<menuitem label="保存　　　　　　Ctrl+S" data="save"/>
									<menuitem label="另存为　　　　　Ctrl+Alt+S" data="saveAs"/>
									<menuitem label="导入图片" data="importFiles"/>
									<menuitem label="导出素材XML" data="1B"/>
									<menuitem label="退出　　　　　　Alt+F4" data="exit"/>
								</menuitem>
							</menu>;
				_loc_2.dataProvider = mbXM;
		}
	}
}