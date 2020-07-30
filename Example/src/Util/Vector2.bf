using System;

namespace Example.Util
{
	public struct Vector2
	{
	    #region Public

	    #region Constructors
	    public this(Vector2 vector) : this(vector.X, vector.Y)
	    {
	    }

	    public this(float x = 0f, float y = 0f)
	    {
	        this.X = x;
			this.Y = y;
	    }
	    #endregion

	    #region Members
	    public float X { get; }

	    public float Y { get; }
	    
	    #endregion

	    #region Static Members
	    public static Vector2 One => Vector2(1f, 1f);
	    public static Vector2 Down => Vector2(0f, -1f);
	    public static Vector2 Left => Vector2(-1f, 0f);
	    public static Vector2 Right => Vector2(1f, 0f);
	    public static Vector2 Up => Vector2(0f, 1f);
	    public static Vector2 Zero => Vector2();
	    #endregion

	    #region Static Methods
		public static int operator<=>(Vector2 left, Vector2 right)
		{
		    var cmp = left.X <=> right.X;
		    if (cmp != 0) {
				return cmp;
			}
		    return left.Y <=> right.Y;
		}

		public static Vector2 operator+(Vector2 left, Vector2 right) => Vector2.Add(left, right);

		public static Vector2 operator-(Vector2 left, Vector2 right) => Vector2.Subtract(left, right);

		public static Vector2 operator-(Vector2 vec)
		{
		    return .(-vec.X, -vec.Y);
		}

	    public static Vector2 Add(Vector2 left, Vector2 right)
	    {
			return .(
				left.X + right.X,
				left.Y + right.Y
			);
	    }

	    public static Vector2 Subtract(Vector2 left, Vector2 right)
	    {
	        return .(
				left.X - right.X,
				left.Y - right.Y
			);
	    }
	    #endregion

	    #endregion
	}
}
