package demo.flashcomps
{
	import com.bit101.components.HBox;
	
	import fl.controls.DataGrid;
	import fl.data.DataProvider;
	
	import flash.display.Sprite;
	
	public class DataGridDemo extends Sprite
	{
		private var  hbox:HBox;
		public function DataGridDemo()
		{
			hbox  = new HBox(this);
			
			var datagridDemo:DataGrid = new DataGrid();
			datagridDemo.columns=["id","name"];
			datagridDemo.dataProvider=new DataProvider([{id:1,name:"wujiyu"},{id:2,name:"a"},{id:3,name:"xiaoguo"}]);
			hbox.addChild(datagridDemo);
		}
	}
}