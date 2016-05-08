package params 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Vladimir Minkin (vk.com/dqvsra)
	 */
	public class FormParams 
	{
		private var _vertexCount:uint;
		private var _radius:uint;
		private var _position:Point;
		private var _drawBoundingBox:Boolean;
		private var _drawRadius:Boolean;
		private var _drawLines:Boolean;
		private var _drawCenter:Boolean;
		private var _colorsFromLines:Boolean;
		private var _drawTris:Boolean;
		
		public function FormParams(
									vertexCount:uint, 
									radius:uint, 
									position:Point, 
									colorsFromLines:Boolean = true,
									drawLines:Boolean = false,
									drawTris:Boolean = true,
									drawCenter:Boolean = false,
									drawBoundingBox:Boolean = false, 
									drawRadius:Boolean = false
								) 
		{
			this.drawTris = drawTris;
			this.colorsFromLines 	= colorsFromLines;
			this.drawCenter 		= drawCenter;
			this.drawLines 			= drawLines;
			this.drawRadius 		= drawRadius;
			this.drawBoundingBox 	= drawBoundingBox;
			this.position 			= position;
			this.radius 			= radius;
			this.vertexCount 		= vertexCount;
			
		}
		
		
		/**
		* Return Value of vertexCount
		*
		* Parameters:
		* @type: uint 
		*/
		//==================================================================================================
		public function get vertexCount():uint {
		//==================================================================================================
			return _vertexCount;
		}
		
		
		/**
		* Set Value for vertexCount
		*
		* Parameters:
		* - value uint
		*/
		//==================================================================================================	
		public function set vertexCount(value:uint):void {
		//==================================================================================================	
			_vertexCount = value;
		}
		
		
		/**
		* Return Value of radius
		*
		* Parameters:
		* @type: uint 
		*/
		//==================================================================================================
		public function get radius():uint {
		//==================================================================================================
			return _radius;
		}
		
		
		/**
		* Set Value for radius
		*
		* Parameters:
		* - value uint
		*/
		//==================================================================================================	
		public function set radius(value:uint):void {
		//==================================================================================================	
			_radius = value;
		}
		
		
		/**
		* Return Value of position
		*
		* Parameters:
		* @type: Point 
		*/
		//==================================================================================================
		public function get position():Point {
		//==================================================================================================
			return _position;
		}
		
		
		/**
		* Set Value for position
		*
		* Parameters:
		* - value Point
		*/
		//==================================================================================================	
		public function set position(value:Point):void {
		//==================================================================================================	
			_position = value;
		}
		
		
		/**
		* Return Value of drawBoundingBox
		*
		* Parameters:
		* @type: Boolean 
		*/
		//==================================================================================================
		public function get drawBoundingBox():Boolean {
		//==================================================================================================
			return _drawBoundingBox;
		}
		
		
		/**
		* Set Value for drawBoundingBox
		*
		* Parameters:
		* - value Boolean
		*/
		//==================================================================================================	
		public function set drawBoundingBox(value:Boolean):void {
		//==================================================================================================	
			_drawBoundingBox = value;
		}
		
		
		/**
		* Return Value of drawRadius
		*
		* Parameters:
		* @type: Boolean 
		*/
		//==================================================================================================
		public function get drawRadius():Boolean {
		//==================================================================================================
			return _drawRadius;
		}
		
		
		/**
		* Set Value for drawRadius
		*
		* Parameters:
		* - value Boolean
		*/
		//==================================================================================================	
		public function set drawRadius(value:Boolean):void {
		//==================================================================================================	
			_drawRadius = value;
		}
		
		
		/**
		* Return Value of drawLines
		*
		* Parameters:
		* @type: Boolean 
		*/
		//==================================================================================================
		public function get drawLines():Boolean {
		//==================================================================================================
			return _drawLines;
		}
		
		
		/**
		* Set Value for drawLines
		*
		* Parameters:
		* - value Boolean
		*/
		//==================================================================================================	
		public function set drawLines(value:Boolean):void {
		//==================================================================================================	
			_drawLines = value;
		}
		
		
		/**
		* Return Value of drawCenter
		*
		* Parameters:
		* @type: Boolean 
		*/
		//==================================================================================================
		public function get drawCenter():Boolean {
		//==================================================================================================
			return _drawCenter;
		}
		
		
		/**
		* Set Value for drawCenter
		*
		* Parameters:
		* - value Boolean
		*/
		//==================================================================================================	
		public function set drawCenter(value:Boolean):void {
		//==================================================================================================	
			_drawCenter = value;
		}
		
		
		/**
		* Return Value of colorsFromLines
		*
		* Parameters:
		* @type: Boolean 
		*/
		//==================================================================================================
		public function get colorsFromLines():Boolean {
		//==================================================================================================
			return _colorsFromLines;
		}
		
		
		/**
		* Set Value for colorsFromLines
		*
		* Parameters:
		* - value Boolean
		*/
		//==================================================================================================	
		public function set colorsFromLines(value:Boolean):void {
		//==================================================================================================	
			_colorsFromLines = value;
		}
		
		
		/**
		* Return Value of drawTris
		*
		* Parameters:
		* @type: Boolean 
		*/
		//==================================================================================================
		public function get drawTris():Boolean {
		//==================================================================================================
			return _drawTris;
		}
		
		
		/**
		* Set Value for drawTris
		*
		* Parameters:
		* - value Boolean
		*/
		//==================================================================================================	
		public function set drawTris(value:Boolean):void {
		//==================================================================================================	
			_drawTris = value;
		}
		
	}

}
