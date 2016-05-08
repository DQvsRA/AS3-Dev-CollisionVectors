package classes.entity {
	import flash.system.Capabilities;
	/**
	 * ...
	 * @author Vladimir Minkin
	 */
	public class BoundingBox {
		
		public var 		left		:int;
		public var 		right		:int;
		public var 		top			:int;
		public var 		bottom		:int;
		
		private var 	_area:Number;
		private var 	_areaCM:Number;
		
		public function BoundingBox(l:int,r:int,t:int,b:int) {
			left 	= l;
			right 	= r;
			top 	= t;
			bottom 	= b;
		}
		
		public function get area():Number {
			if (!_area) {
				_area = (right - left) * (bottom - top);
			}
			return _area;
		}
		
		public function get areaCM():Number {
			if (!_areaCM) {
				_areaCM = area * 2.54 / Capabilities.screenDPI;
			}
			return _areaCM;
		}
		
		public function toString():String
		{
			var template: Array = ["left:", 0, "| right:", 0, "| top:", 0, "| bottom:", 0];
			template[1] = left;
			template[3] = right;
			template[5] = top;
			template[7] = bottom;
			
			return template.join(" ");
		}
	}

}
