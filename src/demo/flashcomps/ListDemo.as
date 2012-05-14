package demo.flashcomps
{
	import com.bit101.components.VBox;
	
	import fl.controls.Label;
	import fl.controls.List;
	import fl.data.DataProvider;
	
	import flash.display.Sprite;
	import flash.events.Event;

	public class ListDemo extends Sprite
	{
		private var label:Label=new Label();

		public function ListDemo()
		{
			var vbox:VBox=new VBox(this);
			var list:List=new List();
			list.dataProvider=new DataProvider([{label:"apple"},{label:"organe"}]);
			vbox.addChild(label);
			vbox.addChild(list);
			list.addEventListener(Event.CHANGE, selectHandler);
		}

		protected function selectHandler(event:Event):void
		{
			event.stopImmediatePropagation();
			label.text= (event.target as List).selectedItem.label;
		}
	}
}
