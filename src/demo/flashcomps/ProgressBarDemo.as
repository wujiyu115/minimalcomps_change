package demo.flashcomps
{
	import fl.controls.ProgressBar;
	
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	public class ProgressBarDemo extends Sprite
	{
		public function ProgressBarDemo()
		{
			var sound:Sound = new Sound();
			
		  var pro:ProgressBar = new ProgressBar();
		  pro.value=50;
		  pro.source = sound;
		  sound.load(new URLRequest("http://221.122.49.245:5188/UserFiles/Uploads/86/201110271110002095768.mp3"));
		  sound.play();
		  addChild(pro);
		}
	}
}