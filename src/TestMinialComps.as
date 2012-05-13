package 
{
	import flash.display.Sprite;
	import com.bit101.components.Accordion;
	import com.bit101.components.Calendar;
	import com.bit101.components.CheckBox;
	import com.bit101.components.ColorChooser;
	import com.bit101.components.ComboBox;
	
	import com.bit101.components.Label;
	import com.bit101.components.List;
	import com.bit101.utils.MinimalConfigurator;
	import com.far.extend.CheckBoxGroup;
	import com.far.extend.TreeList;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class TestMinialComps extends Sprite
	{
		public function TestMinialComps()
		{
			super();
			test();
		}
		
		public function test():void
		{
			var accordion:Accordion=new Accordion(this, 0, 0);
			accordion.addWindow("微软雅黑");
			accordion.getWindowAt(0).title="吴济宇";
			
			
			var calendar:Calendar=new Calendar(this, 100, 0);
			
			var checkbox1:CheckBox=new CheckBox(this, 250, 0, "游戏", checkBoxHandler);
			var checkbox2:CheckBox=new CheckBox(this, 280, 0, "电脑");
			var checkboxgroup:CheckBoxGroup=new CheckBoxGroup(Vector.<CheckBox>([checkbox1, checkbox2]));
			function checkBoxHandler(e:MouseEvent):void
			{
				trace(checkboxgroup.getSelectCheckBox().length);
			}
			
			var colorChooser:ColorChooser=new ColorChooser(this, 320, 0);
			colorChooser.usePopup=true;
			trace(colorChooser.value);
			
			var combobox:ComboBox=new ComboBox(this, 400, 0, "apple");
			var arr:Array=["apple", "oragen"];
			combobox.items=arr;
			combobox.addItemAt("a", 0);
			
			var list:List=new List(this, 500, 0);
			list.addEventListener(Event.SELECT, selelctList);
			list.items=["apple", "oragen", "oragen", "oragen", "oragen", "oragen", "oragen", ""];
			function selelctList(e:Event):void
			{
				trace(list.selectedIndex);
				trace(list.selectedItem);
			}
			
			
			//使用xml来配置
			var xml:XML=<comps>
					<Label id="myLabel" x="10" y="200" text="waiting..."/>
					<PushButton x="10" y="240" label="click me" event="click:onClick"/>
				</comps>;
			var config:MinimalConfigurator=new MinimalConfigurator(this);
			config.parseXML(xml);
			
			
			//treelist
			var treeItems:Array=[{label: 'treelist_test_app', items: [{label: 'bin', expanded: false, items: [{label: 'js', items: [{label: 'swfobject.js'}]}, {label: 'expressInstall.swf'}, {label: 'index.html'}, {label: 'TreeListTestApp.swf'}]}, {label: 'lib', items: []}, {label: 'obj', items: [{label: 'TreeListTestAppConfig.old'}, {label: 'TreeListTestAppConfig.xml'}]}, {label: 'src', items: []}, {label: 'file_tree_test.as'}, {label: 'TreeList Test App.as3proj'},]}];
			var testTree:TreeList=new TreeList(this, 100, 200, treeItems);
			testTree.setSize(200, 200);
			testTree.addEventListener(Event.SELECT, handleTestTreeSelect);
			function handleTestTreeSelect(e:Event):void
			{
				trace('TreeList select:', TreeList(e.target).selectedItem.label);
			}
		}
		public var myLabel:Label;
		
		public function onClick(event:MouseEvent):void
		{
			myLabel.text="You did it";
		}
	}
}