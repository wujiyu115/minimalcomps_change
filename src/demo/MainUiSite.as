package demo
{
	import com.bit101.components.HBox;
	import com.bit101.components.Label;
	import com.bit101.components.Panel;
	import com.bit101.components.PushButton;
	import com.bit101.components.ScrollPane;
	import com.bit101.components.VBox;
	
	import demo.event.CompsEvent;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;

	public class MainUiSite extends Sprite
	{
		private var _uiNames:Array=["flashcomps", "minimalcomps", "bloom","flashk"];
		private var classes:Array=[FlashcompsUI, MinimalcompsUI,BloomUI,FlashKUI];
		
		private var _uiVbox:VBox; //按钮
		private var _compsPanel:ScrollPane; //组件面板
		private var _onecomPanel:Panel; //组件使用面板

		private var _compsButtonDic:Dictionary=new Dictionary(true);
		private var _onecompsButtonDic:Dictionary=new Dictionary(true);
	

		public function MainUiSite()
		{
			addChildren();
		}

		private function addChildren():void
		{
			var label:Label=new Label(this, 10, 10, " Comps by far.");
			label.scaleX=label.scaleY=2;
			var hbox:HBox=new HBox(this);
			hbox.y=50;
			hbox.spacing=20;
			_uiVbox=new VBox(hbox);
			for (var i:int=0; i < _uiNames.length; i++)
			{
				var button:PushButton=new PushButton(_uiVbox, 0, 0, _uiNames[i], compsButtonHander);
			}
			_compsPanel=new ScrollPane(hbox);
			_compsPanel.autoHideScrollBar=true;
			_onecomPanel=new Panel(hbox);
			_onecomPanel.width=400;
			changeComps(_uiNames[0]);

			addEventListener(CompsEvent.COMPSNAME, getaddCompshandler);
			sameHeight();
		}

		protected function getaddCompshandler(event:Event):void
		{
			removeAllChildren(_onecomPanel.content);
			var cls:Class=(event as CompsEvent).cls;
			if (_onecompsButtonDic[cls])
			{
				_onecomPanel.content.addChild(_onecompsButtonDic[cls]);

			}
			else
			{
				var mc:*=new cls();
				_onecomPanel.content.addChild(mc);
				_onecompsButtonDic[cls]=mc;
			}
		}

		private function compsButtonHander(event:MouseEvent):void
		{
			var label:String=(event.currentTarget as PushButton).label;
			changeComps(label);
		}

		private function changeComps(label:String):void
		{
			var cls:Class;
			var index:int=_uiNames.indexOf(label);
			if (index != -1 && classes[index])
			{
				cls=classes[index];
			}
			else
			{
				return;
			}
			removeAllChildren(_compsPanel.content);
			removeAllChildren(_onecomPanel.content);
			// 当滚动面板里面的内容改变时需要手动更新
			_compsPanel.update();

			if (_compsButtonDic[cls])
			{
				_compsPanel.content.addChild(_compsButtonDic[cls]);
			}
			else
			{
				_compsButtonDic[cls]=new cls(_compsPanel.content);
			}
		}

		private function removeAllChildren(coms:DisplayObjectContainer):void
		{
			while (coms.numChildren)
			{
				coms.removeChildAt(0);
			}
		}

		private function sameHeight():void
		{
			_onecomPanel.height=_compsPanel.height=_uiVbox.height=400;
		}
	}
}
