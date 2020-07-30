namespace Example.Util
{
	public struct Vector4
	{
		#region Public

		#region Constructors
		public this()
		{
			this = default;
		}

		public this(Vector4 other) : this(
			other.X,
			other.Y,
			other.Z,
			other.W
		)
		{
		}

		public this(float x, float y, float z, float w)
		{
			X = x;
			Y = y;
			Z = z;
			W = w;
		}
		#endregion

		#region Members
		public float X { get; }
		public float Y { get; }
		public float Z { get; }
		public float W { get; }
		#endregion

		#endregion
	}
}
