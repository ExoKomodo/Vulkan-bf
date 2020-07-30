using System;

namespace Example.Util
{
    public struct Matrix
    {
        #region Public

		#region Constructors
		public this()
		{
			this = default;
		}

		public this(
			Vector4 row1, Vector4 row2, Vector4 row3, Vector4 row4
		) : this(
			row1.X, row1.Y, row1.Z, row1.W,
			row2.X, row2.Y, row2.Z, row2.W,
			row3.X, row3.Y, row3.Z, row3.W,
			row4.X, row4.Y, row4.Z, row4.W,
		)
		{
		}

        public this(
			float m11, float m12, float m13, float m14,
			float m21, float m22, float m23, float m24,
			float m31, float m32, float m33, float m34,
			float m41, float m42, float m43, float m44
		)
        {
            this.M11 = m11;
            this.M12 = m12;
            this.M13 = m13;
            this.M14 = m14;
            this.M21 = m21;
            this.M22 = m22;
            this.M23 = m23;
            this.M24 = m24;
            this.M31 = m31;
            this.M32 = m32;
            this.M33 = m33;
            this.M34 = m34;
            this.M41 = m41;
            this.M42 = m42;
            this.M43 = m43;
            this.M44 = m44;
        }
        #endregion

        #region Members

        public float M11 { get; private set mut; }
        public float M12 { get; private set mut; }
        public float M13 { get; private set mut; }
        public float M14 { get; private set mut; }

        public float M21 { get; private set mut; }
        public float M22 { get; private set mut; }
        public float M23 { get; private set mut; }
        public float M24 { get; private set mut; }

        public float M31 { get; private set mut; }
        public float M32 { get; private set mut; }
        public float M33 { get; private set mut; }
        public float M34 { get; private set mut; }

        public float M41 { get; private set mut; }
        public float M42 { get; private set mut; }
        public float M43 { get; private set mut; }
        public float M44 { get; private set mut; }

        #endregion

		#region Member Methods
		
		#endregion

		#region Operator Overloads
		public float this[int index]
		{
		    get
		    {
				Runtime.Assert(index >= 0 || index < 16);
		        switch (index)
		        {
		            case 0: return M11;
		            case 1: return M12;
		            case 2: return M13;
		            case 3: return M14;
		            case 4: return M21;
		            case 5: return M22;
		            case 6: return M23;
		            case 7: return M24;
		            case 8: return M31;
		            case 9: return M32;
		            case 10: return M33;
		            case 11: return M34;
		            case 12: return M41;
		            case 13: return M42;
		            case 14: return M43;
		            case 15: return M44;
					default: Runtime.FatalError("Matrix index error. Should never occur due to former check");
		        }
		    }

		    set mut
		    {
				Runtime.Assert(index >= 0 || index < 16);
		        switch (index)
		        {
		            case 0: M11 = value; break;
		            case 1: M12 = value; break;
		            case 2: M13 = value; break;
		            case 3: M14 = value; break;
		            case 4: M21 = value; break;
		            case 5: M22 = value; break;
		            case 6: M23 = value; break;
		            case 7: M24 = value; break;
		            case 8: M31 = value; break;
		            case 9: M32 = value; break;
		            case 10: M33 = value; break;
		            case 11: M34 = value; break;
		            case 12: M41 = value; break;
		            case 13: M42 = value; break;
		            case 14: M43 = value; break;
		            case 15: M44 = value; break;
		            default: Runtime.FatalError("Matrix index error. Should never occur due to former check");
		        }
		    }
		}

		public float this[int row, int column]
		{
		    get
		    {
		        return this[(row * 4) + column];
		    }

		    set mut
		    {
		        this[(row * 4) + column] = value;
		    }
		}
		#endregion

		#region Static

		#region Methods
		public static Matrix CreateFromYawPitchRoll(float x, float y, float z)
		{
			return Matrix();
		}
		#endregion

		#endregion

		#endregion
    }
}
