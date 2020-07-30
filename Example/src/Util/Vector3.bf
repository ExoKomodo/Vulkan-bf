namespace Example.Util
{
	public struct Vector3
	{
	    #region Public

	    #region Constructors
	    public this(Vector3 vector) : this(vector.X, vector.Y, vector.Z)
	    {
	    }

	    public this(float x = 0f, float y = 0f, float z = 0f)
	    {
	        this.X = x;
			this.Y = y;
			this.Z = z;
	    }
	    #endregion

	    #region Public Members
	    public float X { get; }

	    public float Y { get; }

	    public float Z { get; }

	    #endregion

	    #region Static Members
	    public static Vector3 One => Vector3(1f, 1f, 1f);

	    public static Vector3 Zero => Vector3();

	    public static Vector3 Up => Vector3(0f, 1f, 0f);

	    public static Vector3 Down => -Up;

	    public static Vector3 Right => Vector3(1f, 0f, 0f);

	    public static Vector3 Left => -Right;

	    public static Vector3 Back => Vector3(0f, 0f, 1f);

	    public static Vector3 Forward => -Back;
	    #endregion

	    #region Static Methods
	    public static int operator<=>(Vector3 left, Vector3 right)
		{
		    var cmp = left.X <=> right.X;
		    if (cmp != 0) {
				return cmp;
			}
		    cmp = left.Y <=> right.Y;
			if (cmp != 0) {
				return cmp;
			}
			return left.Z <=> right.Z;
		}

		public static Vector3 operator+(Vector3 left, Vector3 right) => Vector3.Add(left, right);

		public static Vector3 operator-(Vector3 left, Vector3 right) => Vector3.Subtract(left, right);

		public static Vector3 operator-(Vector3 vec)
		{
		    return .(-vec.X, -vec.Y, -vec.Z);
		}
		public static Vector3 operator*(Vector3 left, float right) => Vector3.Multiply(left, right);

		public static Vector3 Add(Vector3 left, Vector3 right)
		{
			return .(
				left.X + right.X,
				left.Y + right.Y,
				left.Z + right.Z
			);
		}

		public static Vector3 Multiply(Vector3 left, float right)
		{
			return .(
				left.X * right,
				left.Y * right,
				left.Z * right
			);
		}

		public static Vector3 Subtract(Vector3 left, Vector3 right)
		{
		    return .(
				left.X - right.X,
				left.Y - right.Y,
				left.Z - right.Z
			);
		}
	    #endregion

	    #endregion
	}
}
