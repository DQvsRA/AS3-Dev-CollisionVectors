package params 
{
	/**
	 * ...
	 * @author Vladimir Minkin (vk.com/dqvsra)
	 */
	public class ColorParams 
	{
		public static const COLOR_TYPE_WARM:uint = 0;
		
		private var _lineWidth:uint;
		private var _lineColor:uint;
		private var _colorType:uint;
		private var _lineAlpha:Number;
		private var _shapeColor:uint;
		private var _shapeAlpha:Number;
		
		public function ColorParams(
									lineColor:uint, 
									lineWidth:uint, 
									lineAlpha:Number, 
									shapeColor:uint,
									shapeAlpha:Number,
									colorType:uint
									) 
		{
			this.shapeAlpha 	= shapeAlpha;
			this.shapeColor 	= shapeColor;
			this.lineAlpha 		= lineAlpha;
			this.colorType 		= colorType;
			this.lineColor 		= lineColor;
			this.lineWidth 		= lineWidth;
		}
		
		
		/**
		* Return Value of lineWidth
		*
		* Parameters:
		* @type: uint 
		*/
		//==================================================================================================
		public function get lineWidth():uint {
		//==================================================================================================
			return _lineWidth;
		}
		
		
		/**
		* Return Value of lineColor
		*
		* Parameters:
		* @type: uint 
		*/
		//==================================================================================================
		public function get lineColor():uint {
		//==================================================================================================
			return _lineColor;
		}
		
		
		/**
		* Return Value of colorType
		*
		* Parameters:
		* @type: String 
		*/
		//==================================================================================================
		public function get colorType():uint {
		//==================================================================================================
			return _colorType;
		}
		
		
		/**
		* Set Value for colorType
		*
		* Parameters:
		* - value String
		*/
		//==================================================================================================	
		public function set colorType(value:uint):void {
		//==================================================================================================	
			_colorType = value;
		}
		
		
		/**
		* Set Value for lineWidth
		*
		* Parameters:
		* - value uint
		*/
		//==================================================================================================	
		public function set lineWidth(value:uint):void {
		//==================================================================================================	
			_lineWidth = value;
		}
		
		
		/**
		* Set Value for lineColor
		*
		* Parameters:
		* - value uint
		*/
		//==================================================================================================	
		public function set lineColor(value:uint):void {
		//==================================================================================================	
			_lineColor = value;
		}
		
		
		/**
		* Return Value of lineAlpha
		*
		* Parameters:
		* @type: Number 
		*/
		//==================================================================================================
		public function get lineAlpha():Number {
		//==================================================================================================
			return _lineAlpha;
		}
		
		
		/**
		* Set Value for lineAlpha
		*
		* Parameters:
		* - value Number
		*/
		//==================================================================================================	
		public function set lineAlpha(value:Number):void {
		//==================================================================================================	
			_lineAlpha = value;
		}
		
		
		/**
		* Return Value of shapeColor
		*
		* Parameters:
		* @type: uint 
		*/
		//==================================================================================================
		public function get shapeColor():uint {
		//==================================================================================================
			return _shapeColor;
		}
		
		
		/**
		* Set Value for shapeColor
		*
		* Parameters:
		* - value uint
		*/
		//==================================================================================================	
		public function set shapeColor(value:uint):void {
		//==================================================================================================	
			_shapeColor = value;
		}
		
		
		/**
		* Return Value of shapeAlpha
		*
		* Parameters:
		* @type: Number 
		*/
		//==================================================================================================
		public function get shapeAlpha():Number {
		//==================================================================================================
			return _shapeAlpha;
		}
		
		
		/**
		* Set Value for shapeAlpha
		*
		* Parameters:
		* - value Number
		*/
		//==================================================================================================	
		public function set shapeAlpha(value:Number):void {
		//==================================================================================================	
			_shapeAlpha = value;
		}
		
	}

}
