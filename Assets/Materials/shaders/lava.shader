// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:0,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:33127,y:32703,varname:node_2865,prsc:2|emission-2931-RGB,custl-2931-RGB;n:type:ShaderForge.SFN_Slider,id:5949,x:31772,y:32780,ptovrint:False,ptlb:node_5949,ptin:_node_5949,varname:node_5949,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.8205125,max:1;n:type:ShaderForge.SFN_OneMinus,id:2555,x:32107,y:32735,varname:node_2555,prsc:2|IN-5949-OUT;n:type:ShaderForge.SFN_Tex2d,id:1381,x:32137,y:33082,ptovrint:False,ptlb:node_1381,ptin:_node_1381,varname:node_1381,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_RemapRange,id:2910,x:32262,y:32874,varname:node_2910,prsc:2,frmn:0,frmx:1,tomn:-0.5,tomx:0.5|IN-2555-OUT;n:type:ShaderForge.SFN_Add,id:717,x:32476,y:32982,varname:node_717,prsc:2|A-2910-OUT,B-1381-R;n:type:ShaderForge.SFN_RemapRange,id:5179,x:32761,y:32652,varname:node_5179,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-4224-OUT;n:type:ShaderForge.SFN_Tex2d,id:7324,x:31946,y:32504,ptovrint:False,ptlb:node_7324,ptin:_node_7324,varname:node_7324,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1e1acd1e111464bbba77c358ef6f34de,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4224,x:32705,y:32930,varname:node_4224,prsc:2|A-9006-OUT,B-717-OUT;n:type:ShaderForge.SFN_OneMinus,id:9006,x:32391,y:32486,varname:node_9006,prsc:2|IN-7324-R;n:type:ShaderForge.SFN_Append,id:4179,x:32681,y:33152,varname:node_4179,prsc:2|A-717-OUT,B-2860-OUT;n:type:ShaderForge.SFN_Vector1,id:2860,x:32504,y:33277,varname:node_2860,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2d,id:2931,x:32858,y:33135,ptovrint:False,ptlb:node_2931,ptin:_node_2931,varname:node_2931,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:271f5ee3273dd7f4fae6e204d4f8c4bf,ntxv:0,isnm:False|UVIN-4179-OUT;proporder:5949-1381-7324-2931;pass:END;sub:END;*/

Shader "lava" {
    Properties {
        _node_5949 ("node_5949", Range(0, 1)) = 0.8205125
        _node_1381 ("node_1381", 2D) = "white" {}
        _node_7324 ("node_7324", 2D) = "white" {}
        _node_2931 ("node_2931", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers ps4 psp2 
            #pragma target 3.0
            uniform float _node_5949;
            uniform sampler2D _node_1381; uniform float4 _node_1381_ST;
            uniform sampler2D _node_2931; uniform float4 _node_2931_ST;
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
                float4 _node_1381_var = tex2D(_node_1381,TRANSFORM_TEX(i.uv0, _node_1381));
                float node_717 = (((1.0 - _node_5949)*1.0+-0.5)+_node_1381_var.r);
                float2 node_4179 = float2(node_717,0.0);
                float4 _node_2931_var = tex2D(_node_2931,TRANSFORM_TEX(node_4179, _node_2931));
                float3 emissive = _node_2931_var.rgb;
                float3 finalColor = emissive + _node_2931_var.rgb;
                fixed4 finalRGBA = fixed4(finalColor,1);
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
            #pragma exclude_renderers ps4 psp2 
            #pragma target 3.0
            uniform float _node_5949;
            uniform sampler2D _node_1381; uniform float4 _node_1381_ST;
            uniform sampler2D _node_2931; uniform float4 _node_2931_ST;
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
                
                float4 _node_1381_var = tex2D(_node_1381,TRANSFORM_TEX(i.uv0, _node_1381));
                float node_717 = (((1.0 - _node_5949)*1.0+-0.5)+_node_1381_var.r);
                float2 node_4179 = float2(node_717,0.0);
                float4 _node_2931_var = tex2D(_node_2931,TRANSFORM_TEX(node_4179, _node_2931));
                o.Emission = _node_2931_var.rgb;
                
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
