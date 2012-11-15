package cn.flashk.controls 
{
	import cn.flashk.controls.managers.SkinLoader;
	import cn.flashk.controls.managers.SkinManager;
	import cn.flashk.controls.managers.SourceSkinLinkDefine;
	import cn.flashk.controls.managers.StyleManager;
	import cn.flashk.controls.skin.ActionDrawSkin;
	import cn.flashk.controls.skin.VScrollBarSkin;
	import cn.flashk.controls.skin.sourceSkin.VScrollBarSourceSkin;
	import cn.flashk.controls.support.UIComponent;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.utils.clearTimeout;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	/**
	 * VScrollBar 组件是一个竖直滚动条，可方便的设定DisplayObject滚动。
	 * 
	 * <p>滚动条可设定缓冲（可以设定缓冲模式，大小值）/关闭缓冲。并且可以隐藏两端的小箭头。</p>
	 * <p>滚动条可以设定当用户在滚动目标上按下鼠标时可以直接拖动内容</p>
	 *  
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @see cn.flashk.controls.support.UIComponent
	 * 
	 * @author flashk
	 */
	public class VScrollBar extends UIComponent
	{
		public static var defaultWidth:Number = 17;
		public var snapNum:Number = 1;
		public var whenDragUnableTargetMouseEvent:Boolean = true;
		public var mousemouseWheelDelta:uint = 7;
		protected var _autoClip:Boolean = true;
		protected var _target:DisplayObject;
		protected var clipWidth:Number;
		protected var clipHeight:Number;
		protected var clipX:Number;
		protected var clipY:Number;
		protected var scrollerRef:Sprite;
		protected var arrowUpRef:Sprite;
		protected var arrowDownRef:Sprite;
		protected var barRef:Sprite;
		protected var max:Number;
		protected var maxPos:Number=0;
		protected var targetHeight:Number;
		protected var targetWidth:Number;
		protected var stepNum:Number = 10;
		protected var timer:Timer;
		protected var isUpPress:Boolean = false;
		protected var _smoothScroll:Boolean = true;
		protected var _smoothNum:Number = 3;
		protected var toY:Number = 0;
		protected var isDrag:Boolean = false;
		protected var unableUpdate:Boolean = false;
		protected var timeOutID:uint;
		protected var handY:Number;
		protected var handRecY:Number;
		protected var _hideArrow:Boolean = false;
		protected var _mouseOutAlpha:Number;
		protected var lastPos:Number=0;
		protected var isTextField:Boolean = false;
		protected var lastMaxScrollV:uint;
		protected var _checkTimer:Timer;
		
		public function VScrollBar() 
		{
			super();
            
			_compoWidth = defaultWidth;
			_compoHeight = 100;
			_smoothNum = StyleManager.globalScrollBarSmoothNum;
			timer = new Timer(60);
			timer.addEventListener(TimerEvent.TIMER, scrollUpOrDown);
			initMouseEvents();
			this.addEventListener(MouseEvent.MOUSE_OUT, setMyAlphaOut);
			this.addEventListener(MouseEvent.MOUSE_OVER, setMyAlphaIn);
			mouseOutAlpha = 1;
			setSize(_compoWidth, _compoHeight);
			this.addEventListener(Event.ADDED_TO_STAGE,checkText);
		}
		public function set autoClip(value:Boolean):void {
			_autoClip = value;
			if (_autoClip == true && _target != null) {
				_target.scrollRect = new Rectangle(clipX, Math.round(lastPos), clipWidth, clipHeight);
			}
		}
		public function get autoClip():Boolean {
			return _autoClip;
		}
		public function set smoothScroll(value:Boolean):void {
			_smoothScroll = value;
		}
		public function get smoothScroll():Boolean {
			return _smoothScroll;
		}
		public function set smoothNum(value:Number):void {
			_smoothNum = value;
		}
		public function get smoothNum():Number {
			return _smoothNum;
		}
		public function set hideArrow(value:Boolean):void {
			_hideArrow = value;
			if (_hideArrow  == true) {
				arrowDownRef.visible = false;
				arrowUpRef.visible = false;
				scrollerRef.y = 0;
			}
		}
		public function set arrowClickStep(value:Number):void{
			stepNum = value;
		}
		/**
		 * 设置鼠标移开是滚动条的透明度，用户鼠标移开滚动条后滚动条会慢慢渐隐至此透明度，用户鼠标移上滚动条将以较快的速度回到1的alpha，默认0.3
		 */ 
		public function set mouseOutAlpha(value:Number):void {
			_mouseOutAlpha = value;
			this.alpha = _mouseOutAlpha;
		}
		public function get mouseOutAlpha():Number {
			return _mouseOutAlpha;
		}
		public function get maxScrollPosition():Number {
			if(isTextField)
			{
				return TextField(_target).maxScrollV-1;
			}
			updateMaxPos();
			return maxPos;
		}
		public function get scrollPosition():Number{
			return toY;
		}
		public function get clipSize():Number {
			if(isTextField)
			{
				return TextField(_target).bottomScrollV-TextField(_target).scrollV+1;
			}
			return clipHeight;
		}
		public function set clipSize(value:Number):void{
			clipHeight = value;
		}
		public function getAllUIDisplayObject():Array {
			return [barRef, scrollerRef, arrowUpRef, arrowDownRef];
		}
		
		/**
		 * 对于target对象为TextField可以使用此函数自动监视文本的更改 
		 * @param isStart 是否启动(true)/清除(false)
		 * @param delay 检测的间隔，毫秒
		 * 
		 */
		public function startAutoCheck(isStart:Boolean,delay:uint=500):void
		{
			if(isStart)
			{
				if(_checkTimer==null)
				{
					_checkTimer = new Timer(delay);
				}
				_checkTimer.delay = delay;
				_checkTimer.addEventListener(TimerEvent.TIMER,checkText);
				_checkTimer.start();
			}else
			{
				if(_checkTimer)
				{
					_checkTimer.removeEventListener(TimerEvent.TIMER,checkText);
					_checkTimer.stop();
					_checkTimer = null;
				}
			}
		}
		private function checkText(event:Event):void
		{
			if( isTextField && lastMaxScrollV != Object(_target).maxScrollV) 
			{
				updateSize();
				lastMaxScrollV = TextField(_target).maxScrollV;
			}
		}
		/**
		 * 
		 * @param target 显示对象或者文本TextField，如果为TextField，则不需要后面的参数
		 * @param enableHandDrag
		 * @param clipWidth
		 * @param clipHeight
		 * @param clipX
		 * @param clipY
		 * 
		 */
		public function setTarget(target:DisplayObject,enableHandDrag:Boolean=false, clipWidth:Number=0, clipHeight:Number=0,clipX:Number=0,clipY:Number=0):void {
			_target = target;
			if(target is TextField)
			{
				isTextField = true;
				_autoClip = false;
				_smoothScroll = false;
				TextField(target).addEventListener(Event.CHANGE,checkUpdate);
				TextField(target).addEventListener(TextEvent.TEXT_INPUT,checkUpdate);
				TextField(target).addEventListener(Event.SCROLL,checkUpdate);
			}else
			{
				isTextField = false;
			}
			this.clipWidth = clipWidth;
			this.clipHeight = clipHeight;
			this.clipX = clipX;
			this.clipY = clipY;
			updateSize(target.height);
			targetWidth = target.width;
			autoClip = _autoClip;
			if (enableHandDrag == true) {
				_target.addEventListener(MouseEvent.MOUSE_DOWN, startHandDrag);
				_target.addEventListener(MouseEvent.MOUSE_OVER, setMyAlphaIn);
				_target.addEventListener(MouseEvent.MOUSE_OUT, setMyAlphaOut);
			}
			if(target is InteractiveObject){
				target.addEventListener(MouseEvent.MOUSE_WHEEL,mouseWellScroll);
			}
		}
		private function checkUpdate(event:Event=null):void
		{
			if(lastMaxScrollV != TextField(_target).maxScrollV)
			{
				updateSize();
				lastMaxScrollV = TextField(_target).maxScrollV;
			}
			updateScrollerY();
		}
		private function checkViewScroll(event:Event=null):void
		{
			if(isTextField==false) 
			{
				if(targetHeight <= clipHeight)
				{
					this.visible = false;
				}else
				{
					this.visible = true;
				}
				return;
			}
			if(TextField(_target).maxScrollV > 1)
			{
				alpha = 1;
				mouseChildren=true;
			}else
			{
				alpha = 0.5;
				mouseChildren=false;
			}
		}
		public function updateSize(newSize:Number=0,isLess:Boolean=false):void{
			if(isTextField && newSize==0)
			{
				if(lastMaxScrollV == TextField(_target).maxScrollV) return;
			}
			targetHeight = newSize;
			updateMaxPos();
			if(lastPos>maxPos && isLess == true){
				lastPos = maxPos;
				if(autoClip == true){
					autoClip= true;
				}
			}
			skin.reDraw();
			checkViewScroll();
		}
		public function clearTargetListener():void {
			_target.removeEventListener(MouseEvent.MOUSE_DOWN, startHandDrag);
			_target.removeEventListener(MouseEvent.MOUSE_OVER, setMyAlphaIn);
			_target.removeEventListener(MouseEvent.MOUSE_OUT, setMyAlphaOut);
			_target.addEventListener(MouseEvent.MOUSE_WHEEL,mouseWellScroll);
			
		}
		/**
		 * 滚动到指定的像素位置
		 */ 
		public function scrollToPosition(value:Number):void {
			if(value<0){
				value = 0;
			}
			updateMaxPos();
			if(value > maxPos){
				value = value;
			}
			_target.scrollRect = new Rectangle(clipX,Math.round(value) , clipWidth, clipHeight);
			updateScrollBarPostion();
		}
		
		override public function setDefaultSkin():void {
			setSkin(VScrollBarSkin);
		}
		override public function setSourceSkin():void {
			setSkin(SkinLoader.getClassFromSkinFile(SourceSkinLinkDefine.SCROLL_BAR));
		}
		override public function setSkin(Skin:Class):void {
			if(SkinManager.isUseDefaultSkin == true){
				skin = new Skin();
				ActionDrawSkin(skin).init(this,styleSet);
			}else{
				var sous:VScrollBarSourceSkin = new VScrollBarSourceSkin();
				sous.init(this,styleSet,Skin);
				skin = sous;
			}
		}
		protected function initMouseEvents():void {
			scrollerRef = Object(skin).scroller as Sprite;
			arrowDownRef = Object(skin).arrowDown as Sprite;
			arrowUpRef = Object(skin).arrowUp as Sprite;
			barRef = Object(skin).bar as Sprite;
			scrollerRef.addEventListener(MouseEvent.MOUSE_DOWN, startDragScroller);
			arrowDownRef.addEventListener(MouseEvent.CLICK, scrollDown);
			arrowDownRef.addEventListener(MouseEvent.MOUSE_DOWN, startTimer);
			arrowUpRef.addEventListener(MouseEvent.MOUSE_DOWN, startTimer);
			arrowUpRef.addEventListener(MouseEvent.CLICK, scrollUp);
			barRef.addEventListener(MouseEvent.MOUSE_DOWN, scrollTo);
		}
		private function mouseWellScroll(event:MouseEvent):void{
			if(isTextField)
			{
				updateScrollerY();
				return;
			}
			var i:int=0;
			for(i =0 ;i<mousemouseWheelDelta;i++){
				if(event.delta <0){
					scrollDown();
				}else{
					scrollUp();
				}
			}
		}
		protected function startDragScroller(event:MouseEvent):void {
			var lessNum:Number = _hideArrow ? 0 : _compoWidth;
			max = _compoHeight - lessNum * 2 - scrollerRef.height;
			scrollerRef.startDrag(false, new Rectangle(0, lessNum, 0, max ));
			this.stage.addEventListener(MouseEvent.MOUSE_UP, stopDragScroller);
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE, updateToPos);
			isDrag = true;
			unableUpdate = true;
			clearTimeout(timeOutID);
			if(_target != null){
				_target.cacheAsBitmap = true;
			}
			var inter:DisplayObjectContainer = _target as DisplayObjectContainer;
			if(inter != null && whenDragUnableTargetMouseEvent == true){
				inter.mouseEnabled = false;
				inter.mouseChildren = false;
			}
			if(_smoothScroll == true){
				this.addEventListener(Event.ENTER_FRAME, scroll);
			}
		}
		protected function stopDragScroller(event:MouseEvent):void {
			scrollerRef.stopDrag();
			this.stage.removeEventListener(MouseEvent.MOUSE_MOVE, updateToPos);
			this.stage.removeEventListener(MouseEvent.MOUSE_UP, stopDragScroller);
			isDrag = false;
			setMyAlphaOut();
			if(_target != null){
				_target.cacheAsBitmap = false;
			}
			var inter:DisplayObjectContainer = _target as DisplayObjectContainer;
			if(inter != null && whenDragUnableTargetMouseEvent == true){
				inter.mouseEnabled = true;
				inter.mouseChildren = true;
			}
			timeOutID = setTimeout(setIsDragLater, 1000);
		}
		protected function setIsDragLater():void {
			unableUpdate = false;
		}
		protected function scroll(event:Event):void {
			if(_target && isTextField)
			{
				TextField(_target).scrollV = TextField(_target).maxScrollV*toY /maxPos;
				return;
			}
			if(_target != null){
				var newY:Number = (toY - getRectPos()) / _smoothNum;
				var absNum:Number = Math.abs(toY - getRectPos());
				if (Math.abs(newY) < 1) {
					if (toY > getRectPos()) {
						newY = 1;
					}else {
						newY = -1;
					}
				}
				if (absNum <= 1 && isDrag == false) {
					this.removeEventListener(Event.ENTER_FRAME, scroll);
					setRectPos(toY);
					return;
				}
				if(absNum > 1){
					setRectPos( getRectPos() + newY);
					if (unableUpdate == false) {
						updateScrollerY();
					}
				}
			}else{
				updateScrollerY();
				this.removeEventListener(Event.ENTER_FRAME, scroll);
			}
		}
		protected function updateToPos(event:MouseEvent):void {
			updateMaxPos();
			var lessNum:Number = _hideArrow ? 0 : _compoWidth;
			toY =  maxPos * (scrollerRef.y - lessNum) / (max );
			if(_smoothScroll == false){
				setRectPos( toY);
			}
			unableUpdate = true;
			this.dispatchEvent(new Event("scroll"));
		}
		protected function updateScrollerY():void {
			var lessNum:Number = _hideArrow ? 0 : _compoWidth;
			max = _compoHeight - lessNum * 2 - scrollerRef.height;
			if(isTextField)
			{
				if(isDrag == false)
				{
					var scm:Number = (TextField(_target).scrollV-1)/(TextField(_target).maxScrollV-1);
					if(scm>1) scm = 1;
					scrollerRef.y = lessNum + max * scm;
				}
			}else
			{
				scrollerRef.y = lessNum + max * getRectPos() / maxPos;
			}
			scrollerRef.y = int(scrollerRef.y);
		}
		public function updateScrollBarPostion():void{
			updateScrollerY();
		}
		private function scrollDown(event:MouseEvent=null):void {
			toY =  toY + stepNum;
			if (toY > maxPos) {
				toY = maxPos;
			}
			if(_smoothScroll == false){
				setRectPos(toY);
				updateScrollerY();
			}else {
				this.addEventListener(Event.ENTER_FRAME, scroll);
			}
			this.dispatchEvent(new Event("scroll"));
		}
		
		private function scrollUp(event:MouseEvent = null):void {
			toY = toY - stepNum;
			if (toY < 0) {
				toY = 0;
			}
			if (_smoothScroll == false) {
				setRectPos(toY);
				updateScrollerY();
			}else {
				this.addEventListener(Event.ENTER_FRAME, scroll);
			}
			this.dispatchEvent(new Event("scroll"));
		}
		protected function scrollTo(event:MouseEvent):void {
			unableUpdate = false;
			updateMaxPos();
			var lessNum:Number = _hideArrow ? 0 : _compoWidth;
			var per:Number = (barRef.mouseY - lessNum - 20) / (_compoHeight - lessNum * 2 - 40);
			if (per < 0) per = 0;
			if (per > 1) per = 1;
			toY =  maxPos * per;
			if(_smoothScroll == false){
				setRectPos(toY);
				updateScrollerY();
			}
			if(_smoothScroll == true){
				this.addEventListener(Event.ENTER_FRAME, scroll);
				max = _compoHeight - _compoWidth * 2 - scrollerRef.height;
				updateMaxPos();
				
				//scrollerRef.y = _compoWidth + max * toY / maxPos;
			}
			this.dispatchEvent(new Event("scroll"));
		}
		protected function scrollUpOrDown(event:Event):void {
			if (isUpPress == false ) {
				scrollDown();
			}else {
				scrollUp();
			}
		}
		protected function startTimer(event:Event):void {
			if (event.currentTarget == arrowDownRef) {
				isUpPress = false;
			}else {
				isUpPress = true;
			}
			timer.start();
			this.stage.addEventListener(MouseEvent.MOUSE_UP, stopTimer);
		}
		protected function stopTimer(event:Event):void {
			timer.stop();
			this.stage.removeEventListener(MouseEvent.MOUSE_UP, stopTimer);
			
		}
		protected function startHandDrag(event:MouseEvent):void {
			this.removeEventListener(Event.ENTER_FRAME, scroll);
			handY = getMousePos();
			handRecY = getRectPos();
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE, handDrag);
			this.stage.addEventListener(MouseEvent.MOUSE_UP, stopHandDrag);
		}
		protected function stopHandDrag(event:MouseEvent):void {
			this.stage.removeEventListener(MouseEvent.MOUSE_MOVE, handDrag);
			this.stage.removeEventListener(MouseEvent.MOUSE_UP, stopHandDrag);
		}
		protected function handDrag(event:MouseEvent):void {
			var hy:Number;
			hy = handRecY - (getMousePos() - handY);
			updateMaxPos();
			if (hy < 0) {
				hy = 0;
			}
			if (hy > maxPos) {
				hy = maxPos;
			}
			setRectPos(hy);
			updateScrollerY();
		}
		protected function getMousePos():Number{
			return this.mouseY;
		}
		protected function updateMaxPos():void {
			if(isTextField)
			{
				maxPos = TextField(_target).maxScrollV;
				return;
			}
			maxPos = (targetHeight - clipHeight);
			if(maxPos<0) maxPos = 0;
		}
		protected function getRectPos():Number {
			return _target.scrollRect.y;
		}
		protected function setRectPos(value:Number):void {
			if(isTextField)
			{
				TextField(_target).scrollV = TextField(_target).maxScrollV*toY /maxPos;
				return;
			}
			var npos:Number = Math.round(value/snapNum)*snapNum;
			//npos = value;
			if(npos != lastPos){
				lastPos = npos;
				_target.scrollRect = new Rectangle(clipX,Math.round(lastPos) , clipWidth, clipHeight);
			}
		}
		public function setMyAlphaOut(event:MouseEvent=null):void {
			//this.alpha = _mouseOutAlpha;
			if(this.mouseChildren==false) return;
			this.removeEventListener(Event.ENTER_FRAME,addAlphaEn);
			this.addEventListener(Event.ENTER_FRAME,lessAlphaEn);
		}
		public function setMyAlphaIn(event:MouseEvent):void {
			//this.alpha = 1.0;
			if(this.mouseChildren==false) return;
			this.removeEventListener(Event.ENTER_FRAME,lessAlphaEn);
			this.addEventListener(Event.ENTER_FRAME,addAlphaEn);
		}
		public function addAlphaEn(event:Event):void{
			this.alpha += 0.08;
			if(this.alpha>=1){
				this.alpha=1
				this.removeEventListener(Event.ENTER_FRAME,addAlphaEn);
			}
		}
		
		public function lessAlphaEn(event:Event):void{
			this.alpha -= 0.03;
			if(this.alpha<=_mouseOutAlpha){
				this.alpha=_mouseOutAlpha;
				this.removeEventListener(Event.ENTER_FRAME,lessAlphaEn);
			}
		}
	}

}