Shader "Unlit/PulsingSurface"
{
	Properties
	{
		//_MainTex ("Texture", 2D) = "white" {}
		_MainColor("Color", Color) = (1,1,1,1)
		_Center("Center of the model", Vector) = (0,0,0,0)
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100

		Pass
		{
			CGPROGRAM
// Upgrade NOTE: excluded shader from DX11; has structs without semantics (struct v2f members dist)
#pragma exclude_renderers d3d11
			#pragma vertex vert
			#pragma fragment frag
			// make fog work
			#pragma multi_compile_fog
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				float dist;
				float4 col : color;
			};

			float4 _MainColor;
			float4 _Center;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.dist = distance(v.vertex.xyz, _Center.xyz);
				o.col = _MainColor;
			
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col = i.col;
				return col;
			}
			ENDCG
		}
	}
}
