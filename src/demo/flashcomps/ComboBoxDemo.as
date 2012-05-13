package demo.flashcomps
{
	import com.bit101.components.Label;
	import com.bit101.components.VBox;
	
	import fl.controls.ComboBox;
	import fl.data.DataProvider;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class ComboBoxDemo extends Sprite
	{
		private var la:Label=new Label();
		public function ComboBoxDemo()
		{
			var hbox:VBox = new VBox(this);
			var combobox:ComboBox = new ComboBox();
			combobox.dataProvider = new DataProvider([{label:"hi",data:"hi"},{label:"yes",data:"yes"}]);
			combobox.addEventListener(Event.CHANGE,selectHandler);
			
			hbox.addChild(la);
			hbox.addChild(combobox);
		}
		
		protected function selectHandler(event:Event):void
		{
			la.text = ((event.target  as ComboBox).selectedItem).label;
		}
	}
}