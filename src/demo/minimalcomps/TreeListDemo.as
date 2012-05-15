package demo.minimalcomps
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-15 上午10:51:19
	 * 
	 */
	import com.far.extend.TreeList;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class TreeListDemo extends Sprite
	{
		public function TreeListDemo()
		{
			var treeItems:Array=[{label: 'treelist_test_app', items: [{label: 'bin', expanded: false, items: [{label: 'js', items: [{label: 'swfobject.js'}]}, {label: 'expressInstall.swf'}, {label: 'index.html'}, {label: 'TreeListTestApp.swf'}]}, {label: 'lib', items: []}, {label: 'obj', items: [{label: 'TreeListTestAppConfig.old'}, {label: 'TreeListTestAppConfig.xml'}]}, {label: 'src', items: []}, {label: 'file_tree_test.as'}, {label: 'TreeList Test App.as3proj'},]}];
			var testTree:TreeList=new TreeList(this, 0, 0, treeItems);
			testTree.setSize(200, 200);
			testTree.addEventListener(Event.SELECT, handleTestTreeSelect);
			function handleTestTreeSelect(e:Event):void
			{
				trace('TreeList select:', TreeList(e.target).selectedItem.label);
			}
		}
	}
}