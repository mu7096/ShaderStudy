Shader "Custom/2022_11_15"
{
    Properties
    {
        //_Name ("display name", Range (min,max)) = number
        _Brightness("chang Brightness!!", Range(0, 1)) = 0.5
        //최솟값 최댓값 입력시 슬라이더 생성

        _TestFloat ("Test Float!!", Float) = 0.5   
        //소수점 입력 인터페이스

        _TestInt ("Test Int!", Int) = 0.5
        //정수형 입력 인터페이스

        _TestColor("Tt Color", Color) = (1,1,1,1)
        //컬러픽커

        _TestVector ("test VC", Vector) = (1,1,1,1)
        //float4를 직접 입력

        _TestTexture ("TestTexture!", 2D) = "white" {}

        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0
        
        //전처리,snippet. 쉐이더 조명 계산 or 세부 분기 설정

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };
        
        //구조체,structure. 엔진으로부터 받아와야할 데이터가 들어감

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;
        
        

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            o.Emission = float3 (1,0,0) + float3 (0,0,0);
            // Metallic and smoothness come from slider variables
            
            o.Alpha = c.a;
        }
        //surf(함수) 색상이나 이미지가 출력되는 부분을 만듦
        ENDCG
    }
    FallBack "Diffuse"
}
