package classes.entity 
{
	import ch.badmojo.color.Color;
	import ch.badmojo.color.ColorWheel;
	import flash.display.NativeMenuItem;
	import flash.geom.Point;
	import params.ColorParams;
	import params.FormParams;
	import starling.display.Graphics;
	import starling.display.graphics.TriangleFan;
	import starling.display.Shape;
	import utils.Utils;
	
	/**
	 * ...
	 * @author Vladimir Minkin (vk.com/dqvsra)
	 */
	public class Form extends Shape 
	{
		private var 
				_vertexCount		:uint = 0
			,	_point				:Point = new Point()
			,	_nextPoint			:Point = new Point()
			,	_vector				:Point = new Point()
			,	_position			:Point = new Point()
			
			,	_area				:Number = 0
			,	_gradius			:Number = 0
			,	_radius				:Number = 0
			,	_center				:Point = new Point(0, 0);
		
		private var	_points				:Vector.<Point>
			,	_vectors			:Vector.<Point>
			,	_colors				:Vector.<uint> 
			,	_grey				:Vector.<uint> 
		;
		
		private var		_counter		:uint;
		private var 	_boundingBox	:BoundingBox;
		private var 	_colorParams	:ColorParams;
		private var 	_formParams		:FormParams;
		
		private var 	_specialAmount	:uint = 0;
		private var 	_specialAngles	:Vector.<Number> = new Vector.<Number>();
		private var 	_specialPoints	:Vector.<Point>;
		
		
		public function Form(formParams:FormParams, colorParams:ColorParams, generate:Boolean = true) 
		{
			_formParams 	= formParams;
			_vertexCount 	= _formParams.vertexCount;
			_gradius 		= _formParams.radius;
			_position 		= _formParams.position;
			_colorParams	= colorParams;
			
			initialize();
			if (generate) generateShape();
		}
		
		private function initialize():void 
		{
			_points			= new Vector.<Point>();
			
			_colors			= new Vector.<uint>();
			_grey			= new Vector.<uint>();
		}
		
		public function generateShape():void {
			generatePoints();
			drawShape();
		}
		
		//==================================================================================================
		private function drawShape():void {
		//==================================================================================================
			_counter 	= _vertexCount;
			_point 		= _points[--_counter];
			_nextPoint 	= _points[_counter - 1];
			
			var tempcalc:Number = (_point.x * _nextPoint.y - _nextPoint.x * _point.y);
			var shapeCenterX:Number = 0//(_point.x  + _nextPoint.x) * tempcalc;
			var shapeCenterY:Number = 0//(_point.y  + _nextPoint.y) * tempcalc;
			
			_area = tempcalc;
			
			_vector = new Point(int(_nextPoint.x - _point.x), int(_nextPoint.y - _point.y))
			_vectors[_counter] = _vector;
			
			if(_formParams.drawLines) {
				graphics.lineStyle(_colorParams.lineWidth, _colorParams.lineColor, _colorParams.lineAlpha);
				graphics.beginFill(_colorParams.shapeColor, _colorParams.shapeAlpha);
				graphics.moveTo(_point.x + 1, _point.y + 1);
			}
			
			while (_counter) {
				_point 		= _points[--_counter];
				_nextPoint 	= _counter != 0 ?  _points[_counter - 1] : _points[_vertexCount - 1];
				
				tempcalc 		= (_point.x * _nextPoint.y - _nextPoint.x * _point.y);
				_area 			+= tempcalc;
				shapeCenterX 	+= (_point.x  + _nextPoint.x) * tempcalc;
				shapeCenterY 	+= (_point.y  + _nextPoint.y) * tempcalc;
				
				_vector = new Point(int(_nextPoint.x - _point.x), int(_nextPoint.y - _point.y))
				_vectors[_counter] = _vector;
				
				if(_formParams.drawLines) {
					drawEntity();
				}
			}
			
			_counter 	= _vertexCount-1;
			_point 		= _points[_vertexCount - 1];
			drawEntity();
			
			_area 		= _area * 0.5;
			tempcalc 	= 1 / (6 * _area);
			_center.x 	= shapeCenterX * tempcalc;
			_center.y 	= shapeCenterY * tempcalc;
			
			_position.x -= Math.abs(_center.x);
			_position.y -= Math.abs(_center.y);
			
			function drawEntity():void {
				graphics.lineTo(_point.x, _point.y);
				//graphics.drawCircle(_point.x - 1, _point.y - 1, 2);
			}
			
			_boundingBox = new BoundingBox(_center.x, _center.x, _center.y, _center.y);
			_counter = _vertexCount;
			_radius = 0;
			
			while (_counter--) {
				_point = _points[_counter];
				
				if (_point.x < _boundingBox.left) 	_boundingBox.left 	= _point.x;
				if (_point.x > _boundingBox.right) 	_boundingBox.right 	= _point.x;
				if (_point.y < _boundingBox.top) 	_boundingBox.top 	= _point.y;
				if (_point.y > _boundingBox.bottom) _boundingBox.bottom = _point.y;
				
				tempcalc = Point.distance(_point, _center);
				if (tempcalc > _radius) _radius = tempcalc;
			}
			if(_formParams.drawRadius) {
				graphics.beginFill(0x00ffff, .1);
				graphics.drawCircle(_center.x, _center.y, _radius);
			}
			if(_formParams.drawBoundingBox) {
				graphics.beginFill(0xfff, .1);
				graphics.moveTo(_boundingBox.left,	_boundingBox.top);
				graphics.lineTo(_boundingBox.right, _boundingBox.top);
				graphics.lineTo(_boundingBox.right, _boundingBox.bottom);
				graphics.lineTo(_boundingBox.left, 	_boundingBox.bottom);
				graphics.lineTo(_boundingBox.left, 	_boundingBox.top);
			}
			
			if(_formParams.drawTris) {
				_counter = _vertexCount;
				while (_counter) {
					_point = _points[--_counter];
					_nextPoint = _counter != 0 ?  _points[_counter - 1] : _points[_points.length - 1];
					
					graphics.beginFill(_colors[_counter], 0.1);
					graphics.moveTo(_center.x, _center.y);
					graphics.lineTo(_point.x, _point.y);
					graphics.lineTo(_nextPoint.x, _nextPoint.y);
					graphics.lineTo(_center.x, _center.y);
				}
			}
			
			if(_formParams.drawCenter) {
				graphics.beginFill(0x00ffff, 1);
				graphics.drawCircle(_center.x, _center.y, 3);
				
				graphics.beginFill(0xff0000, 1);
				graphics.drawCircle(0, 0, 2);
			}
		}
		
		private function generatePoints():void {
			_counter = _vertexCount;
			var		angle			:Number 	= 360 * Utils.ANGLE_TO_RADIAN
				,	alfa			:Number 	= angle / _counter
				,	alfaOffsetMax	:Number 	= alfa * 0.25
				,	alfaOffset		:Number 	= 0
				,	alpha			:Number 	= 0
				,	rotate			:Number 	= 0
				,	hex				:uint 		= 0
				,	grey			:uint 		= 0
				, 	color			:Color
			;
			
			var colors:Array = _formParams.colorsFromLines ? 
									Utils.getColorsByTypeFromHEX(_colorParams.lineColor, _vertexCount, _colorParams.colorType, true)
									: Utils.getRandomColorsByType(_vertexCount, _colorParams.colorType, true);
			
			var specialAngle			:Number = 0;
			var specialCount			:int 	= 0;
			var isSpecialPoint			:Boolean = false;
			var sameAngleSpecialPoint	:Boolean = false;
			var xPos:int = 0, yPos:int = 0;
			var topAngle:Number = 0, bottomAngle:Number = 0;
			while (_counter--) {
				if(_specialAmount > 0) {
					specialCount 	= _specialAmount;
					topAngle 		= alpha + alfa;
					bottomAngle 	= rotate;
					trace("CURRENT | DELTA : " 
							+ int(rotate * Utils.RADIAN_TO_ANGLE) 
							+ " | " + int(bottomAngle * Utils.RADIAN_TO_ANGLE) 
							+ " - " + int(topAngle * Utils.RADIAN_TO_ANGLE) 
							+ " | " + int(alfa * Utils.RADIAN_TO_ANGLE));
					sameAngleSpecialPoint = false;
					while (specialCount > 0) {
						specialAngle = _specialAngles[--specialCount];
						if ( (specialAngle > bottomAngle) && (specialAngle < topAngle) ) {
							isSpecialPoint = true;
							_point = _specialPoints[specialCount];
							if(sameAngleSpecialPoint == false) {
								makeColorValue();
							} else {
								_vertexCount++;
							}
							addEntities();
							sameAngleSpecialPoint = true;
							trace(_counter + ") SPECIAL : " + int(specialAngle * Utils.RADIAN_TO_ANGLE));
						}
					}
				}
				
				
				
				if (isSpecialPoint) {
					//_point = _specialPoints[specialCount];
					//_specialAmount = specialCount;
					graphics.beginFill(0xffffff, 1);
					graphics.drawCircle(_point.x, _point.y, 3);
					graphics.endFill();
					//trace("Special Amount: ", _specialAmount);
					encreaseAngle(false);
				} else {
					xPos = _gradius * Math.sin(rotate);
					yPos = _gradius * Math.cos(rotate);
					_point = new Point( xPos , yPos );
					
					if (_specialAmount == 0) {
						if(specialCount == 0) {
							specialCount = -1;
							graphics.beginFill(0xff00ff, 1);
							graphics.drawCircle(_point.x, _point.y, 5);
							graphics.endFill();
							//trace(_counter + ") Next")
						}
						else {
							//trace(_counter + ") Normal")
						}
					} else {
						//trace(_counter + ") Previous")
						graphics.beginFill(hex, 1);
						graphics.drawCircle(_point.x, _point.y, 3);
						graphics.endFill();
					}
					
					if (_counter == _vertexCount - 2) {
						graphics.beginFill(0x00ff00, 1);
						graphics.drawCircle(_point.x, _point.y, 5);
						graphics.endFill();
					}
					
					makeColorValue();
					addEntities();
					encreaseAngle();
				}
				
				isSpecialPoint = false;
				
			
			}
			
			function makeColorValue():void 
			{
				color 	= colors[_counter];
				hex 	= color.getHex();
				color.deSaturate(100);
				grey 	= color.getHex();
			}

			function addEntities():void 
			{
				_points.push(_point);
				_colors.push(hex);
				_grey.push(grey);
				//_points[_counter] 	= _point;
				//_colors[_counter] 	= hex;
				//_grey[_counter] 	= grey;
			}
			
			function encreaseAngle(offset:Boolean = true):void 
			{
				alpha 		+= alfa;
				alfaOffset 	= offset ? Utils.random( -alfaOffsetMax, alfaOffsetMax ) : 0;
				rotate 		= alpha + alfaOffset;
			}
			
			_vectors = new Vector.<Point>(_vertexCount);
			
			//_points = _points.reverse();
		}
		
		//==================================================================================================
		public function get radius():Number {
		//==================================================================================================
			return _radius;
		}
		
		//==================================================================================================	
		public function set radius(value:Number):void {
		//==================================================================================================	
			_radius = value;
		}
		
		//==================================================================================================
		public function get points():Vector.<Point> {
		//==================================================================================================
			return _points;
		}
		
		//==================================================================================================	
		public function set points(value:Vector.<Point>):void {
		//==================================================================================================	
			_specialAmount = value.length;
			_specialPoints = new Vector.<Point>(_specialAmount);
			if (_specialAmount > _vertexCount) {
				_vertexCount = _specialAmount;
				initialize();
			}
			var specialAngle:Number = 0;
			var distance:Number = 0;
			_counter = 0;
			while (_counter < _specialAmount) {
				_point = value[_counter];
				distance = Point.distance(_point, _center);
				if (distance < _gradius) _gradius = distance;
				specialAngle = Math.acos(_point.y / distance);
				//trace("\n\nX | Y delta : " + int(_point.x) + "|" + int(_point.y));
				//trace("Special Angle before : " + int(specialAngle*Utils.RADIAN_TO_ANGLE));
				if (_point.x < 0) specialAngle = 2 * Math.PI - specialAngle;
				//else specialAngle = specialAngle + Math.PI;
				trace("Special Angle : " + int(specialAngle*Utils.RADIAN_TO_ANGLE));
				_specialAngles.push(specialAngle);
				_specialPoints[_counter++] = _point;
			}
			//trace("_specialAngles = ", _specialAngles);
		}
		
		//==================================================================================================
		public function get position():Point {
		//==================================================================================================
			return _position;
		}
		
		//==================================================================================================	
		public function set position(value:Point):void {
		//==================================================================================================	
			_position = value;
		}
		
		//==================================================================================================
		public function get center():Point {
		//==================================================================================================
			var result:Point = _position;
			//result.x = _center.x > 0 ? result.x - _center.x : result.x + _center.x;
			//result.y = _center.y > 0 ? result.y - _center.y : result.y + _center.y;
			//result.x -= Math.abs(_center.x);
			//result.y -= Math.abs(_center.y);
			return result;
		}
		
		//==================================================================================================	
		public function getCollisionPoints(at:Point, distance:uint):Vector.<Point> {
		//==================================================================================================	
			_counter = _vertexCount;
			at.x = at.x - _position.x;
			at.y = at.y - _position.y;
			var angle:Number = 0;
			var temp:Point;
			var result:Vector.<Point> = new Vector.<Point>();
			var between:Number = 0;
			while (_counter) {
				_point = _points[--_counter];
				between = Point.distance(_point, at);
				if (between < distance) 
				{
					graphics.moveTo(_point.x, _point.y);
					temp = at.clone();
					temp.x = temp.x - Math.abs(_center.x);
					temp.y = temp.y - Math.abs(_center.y);
					graphics.lineTo(temp.x, temp.y);
					_point = new Point(_point.x - temp.x, _point.y - temp.y );
					result.push(_point);
					graphics.drawCircle(_point.x, _point.y, 3);
					graphics.endFill();
				}
			}
			return result;
		}
	}
}
