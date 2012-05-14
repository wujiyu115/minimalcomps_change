package demo.flashcomps
{
	import flash.display.Sprite;
	import fl.controls.CheckBox;
	import fl.controls.ColorPicker;
	import fl.controls.ComboBox;
	import fl.controls.NumericStepper;
	import fl.controls.TileList;
	import fl.data.DataProvider;

	public class TileListDemo extends Sprite
	{
		public function TileListDemo()
		{
			var aCp:ColorPicker = new ColorPicker();
			var aCb:ComboBox = new ComboBox();
			var aNs:NumericStepper = new NumericStepper();
			var aCh:CheckBox = new CheckBox();
			var aTl:TileList = new TileList();
			
			var dp:Array = [
				{label:"ColorPicker", source:aCp},
				{label:"ComboBox", source:aCb},
				{label:"NumericStepper", source:aNs},
				{label:"CheckBox", source:aCh},
			];
			aTl.dataProvider = new DataProvider(dp);
			aTl.columnWidth = 110;
			aTl.rowHeight = 100;
			aTl.setSize(280,130);
			aTl.move(150, 150);
			aTl.setStyle("contentPadding", 5);
			aTl.sortItemsOn("label");
			aTl.mouseChildren=true;
			addChild(aTl);

		}
	}
}