namespace Example.Util
{
	public struct Vertex
	{
		#region Public

		#region Constructors
		public this()
		{
			Position = Vector2.Zero;
			Color = Vector3.Zero;
		}

		public this(Vector2 position, Vector3 color)
		{
			Position = position;
			Color = color;
		}
		#endregion

		#region Members
		// The ordering of these members is significant to the graphics APIs. It is used to calculate offsets when constructing attribute descriptions.
		public Vector2 Position;
		public Vector3 Color;
		#endregion

		#endregion
	}
}
