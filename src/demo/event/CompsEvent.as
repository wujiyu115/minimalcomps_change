package demo.event
{
	import flash.events.Event;

	public class CompsEvent extends Event
	{
		public var cls:Class;
		public static const COMPSNAME:String="COMPSNAME";

		public function CompsEvent(type:String, clss:Class, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			this.cls=clss;
			super(type, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new CompsEvent(type, cls, bubbles, cancelable);
		}


	}
}
