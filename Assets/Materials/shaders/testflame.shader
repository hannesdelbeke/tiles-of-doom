// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:0,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:32719,y:32712,varname:node_2865,prsc:2|emission-1861-OUT,alpha-2259-OUT;n:type:ShaderForge.SFN_Color,id:6665,x:31352,y:33513,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:7131,x:31058,y:32495,ptovrint:False,ptlb:tile,ptin:_tile,varname:node_7131,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:41331fae4d69ac344b0ceb74435b4627,ntxv:0,isnm:False|UVIN-3381-UVOUT;n:type:ShaderForge.SFN_OneMinus,id:6818,x:31572,y:32431,varname:node_6818,prsc:2|IN-7131-R;n:type:ShaderForge.SFN_Slider,id:1105,x:30752,y:32876,ptovrint:False,ptlb:glow,ptin:_glow,varname:_blacksymbol02,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_OneMinus,id:4788,x:31244,y:32718,varname:node_4788,prsc:2|IN-7131-G;n:type:ShaderForge.SFN_Color,id:8769,x:31192,y:33375,ptovrint:False,ptlb:glow color,ptin:_glowcolor,varname:node_8769,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.05882353,c2:0.8052736,c3:1,c4:1;n:type:ShaderForge.SFN_Lerp,id:1861,x:31684,y:33317,varname:node_1861,prsc:2|A-8769-RGB,B-6665-RGB,T-2774-OUT;n:type:ShaderForge.SFN_Multiply,id:2774,x:31319,y:33015,varname:node_2774,prsc:2|A-2497-OUT,B-4788-OUT;n:type:ShaderForge.SFN_TexCoord,id:3381,x:30752,y:32615,varname:node_3381,prsc:2,uv:0;n:type:ShaderForge.SFN_Tex2d,id:1723,x:31661,y:32693,ptovrint:False,ptlb:node_1723,ptin:_node_1723,varname:node_1723,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6234bda70395b01448612cdf4293a309,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:2497,x:30730,y:33008,ptovrint:False,ptlb:glow_copy,ptin:_glow_copy,varname:_glow_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3675214,max:1;n:type:ShaderForge.SFN_Multiply,id:2259,x:32280,y:32635,varname:node_2259,prsc:2|A-6818-OUT,B-357-OUT;n:type:ShaderForge.SFN_Vector1,id:6425,x:31704,y:32941,varname:node_6425,prsc:2,v1:-0.9;n:type:ShaderForge.SFN_Add,id:3630,x:31869,y:32859,varname:node_3630,prsc:2|A-1723-R,B-2497-OUT,C-6425-OUT;n:type:ShaderForge.SFN_Clamp01,id:357,x:32105,y:32859,varname:node_357,prsc:2|IN-5338-OUT;n:type:ShaderForge.SFN_Multiply,id:5338,x:31970,y:33078,varname:node_5338,prsc:2|A-3630-OUT,B-1095-OUT;n:type:ShaderForge.SFN_Vector1,id:1095,x:31704,y:33094,varname:node_1095,prsc:2,v1:10;n:type:ShaderForge.SFN_Tex2d,id:1872,x:31695,y:33553,ptovrint:False,ptlb:node_1872,ptin:_node_1872,varname:node_1872,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;proporder:6665-7131-1105-8769-1723-2497;pass:END;sub:END;*/

Shader "eeee" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _tile ("tile", 2D) = "white" {}
        _glow ("glow", Range(0, 1)) = 1
        _glowcolor ("glow color", Color) = (0.05882353,0.8052736,1,1)
        _node_1723 ("node_1723", 2D) = "white" {}
        _glow_copy ("glow_copy", Range(0, 1)) = 0.3675214
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _Color;
            uniform sampler2D _tile; uniform float4 _tile_ST;
            uniform float4 _glowcolor;
            uniform sampler2D _node_1723; uniform float4 _node_1723_ST;
            uniform float _glow_copy;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
////// Lighting:
////// Emissive:
                float4 _tile_var = tex2D(_tile,TRANSFORM_TEX(i.uv0, _tile));
                float3 emissive = lerp(_glowcolor.rgb,_Color.rgb,(_glow_copy*(1.0 - _tile_var.g)));
                float3 finalColor = emissive;
                float4 _node_1723_var = tex2D(_node_1723,TRANSFORM_TEX(i.uv0, _node_1723));
                fixed4 finalRGBA = fixed4(finalColor,((1.0 - _tile_var.r)*saturate(((_node_1723_var.r+_glow_copy+(-0.9))*10.0))));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _Color;
            uniform sampler2D _tile; uniform float4 _tile_ST;
            uniform float4 _glowcolor;
            uniform float _glow_copy;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                float4 _tile_var = tex2D(_tile,TRANSFORM_TEX(i.uv0, _tile));
                o.Emission = lerp(_glowcolor.rgb,_Color.rgb,(_glow_copy*(1.0 - _tile_var.g)));
                
                float3 diffColor = float3(0,0,0);
                o.Albedo = diffColor;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
