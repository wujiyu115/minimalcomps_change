package demo.bloomcomps
{
	/**
	 * 
	 * Program Name:       ContainerDemo
	 * @author             wujiyu
	 * @email              wujiyu115@gmail.com
	 * @version            1.0
	 * Time:               2012-9-18 下午7:50:21
	 */
	import bloom.components.Button;
	import bloom.components.Container;
	
	import flash.display.Sprite;
	
	public class ContainerDemo extends Sprite
	{
		public function ContainerDemo()
		{
			 var con:Container  = new Container(this);
			 con.addChild(new Button(null,"con"));
		}
	}
}