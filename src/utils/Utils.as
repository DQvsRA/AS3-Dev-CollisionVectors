package utils 
{
	import ch.badmojo.color.Color;
	import ch.badmojo.color.ColorWheel;
	/**
	 * ...
	 * @author Vladimir Minkin (vk.com/dqvsra)
	 */
	public class Utils 
	{
		public static var 	
				ANGLE_TO_RADIAN			: Number = Math.PI / 180,
				RADIAN_TO_ANGLE			: Number = 180 / Math.PI;
				
		public static function random(from:Number, to:Number):Number
		{
			if (from < 0) to += Math.abs(from);
			else to -= from;
			return Number(from + Math.random() * to);
		}		
		
		public static function getRandomColor():Color
		{
			return new Color(Math.random() * 255, Math.random() * 255, Math.random() * 255);
		}
		
		public static function getRandomColorsByType(count:uint, type:uint, shuffle:Boolean = false):Array
		{
			var color:Color = Utils.getRandomColor();
			var	colorwheel:ColorWheel = color.toWarm(count);
			if(shuffle) colorwheel.shuffle();
			return colorwheel.getAsList();
		}
		
		public static function getColorsByTypeFromHEX(value:uint, count:uint, type:uint, shuffle:Boolean = false):Array
		{
			var color:Color = Color.fromHex(value);
			var	colorwheel:ColorWheel = color.toWarm(count);
			if(shuffle) colorwheel.shuffle();
			return colorwheel.getAsList();
		}
		
	}

}
