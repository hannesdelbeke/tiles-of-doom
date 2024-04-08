// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:0,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:33312,y:32586,varname:node_2865,prsc:2|custl-2931-RGB,alpha-2320-OUT;n:type:ShaderForge.SFN_Slider,id:5949,x:31445,y:32664,ptovrint:False,ptlb:glow,ptin:_glow,varname:node_5949,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Tex2d,id:1381,x:31767,y:33034,ptovrint:False,ptlb:node_1381,ptin:_node_1381,varname:node_1381,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-1769-OUT;n:type:ShaderForge.SFN_RemapRange,id:2910,x:31837,y:32729,varname:node_2910,prsc:2,frmn:0,frmx:1,tomn:-0.6,tomx:0.6|IN-5949-OUT;n:type:ShaderForge.SFN_Add,id:717,x:32004,y:32846,varname:node_717,prsc:2|A-2910-OUT,B-1381-R;n:type:ShaderForge.SFN_RemapRange,id:5179,x:32454,y:32712,varname:node_5179,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.9|IN-171-OUT;n:type:ShaderForge.SFN_Tex2d,id:7324,x:31481,y:33190,ptovrint:False,ptlb:tile,ptin:_tile,varname:node_7324,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1e1acd1e111464bbba77c358ef6f34de,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4224,x:32155,y:33107,varname:node_4224,prsc:2|A-9006-OUT,B-717-OUT;n:type:ShaderForge.SFN_OneMinus,id:9006,x:31781,y:33259,varname:node_9006,prsc:2|IN-7324-R;n:type:ShaderForge.SFN_Append,id:4179,x:32578,y:33144,varname:node_4179,prsc:2|A-8315-OUT,B-2860-OUT;n:type:ShaderForge.SFN_Vector1,id:2860,x:32396,y:33250,varname:node_2860,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2d,id:2931,x:32915,y:32929,varname:node_2931,prsc:2,tex:271f5ee3273dd7f4fae6e204d4f8c4bf,ntxv:0,isnm:False|UVIN-8476-OUT,TEX-9457-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:9457,x:32781,y:33228,ptovrint:False,ptlb:node_9457,ptin:_node_9457,varname:node_9457,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:271f5ee3273dd7f4fae6e204d4f8c4bf,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Clamp01,id:8315,x:32488,y:33348,varname:node_8315,prsc:2|IN-2207-OUT;n:type:ShaderForge.SFN_RemapRange,id:2207,x:32308,y:33477,varname:node_2207,prsc:2,frmn:0,frmx:1,tomn:-0.3,tomx:0.3|IN-4224-OUT;n:type:ShaderForge.SFN_Multiply,id:8476,x:32686,y:32851,varname:node_8476,prsc:2|A-4671-OUT,B-4179-OUT;n:type:ShaderForge.SFN_OneMinus,id:1027,x:31796,y:33386,varname:node_1027,prsc:2|IN-7324-G;n:type:ShaderForge.SFN_Slider,id:9020,x:31515,y:33594,ptovrint:False,ptlb:edgeglow,ptin:_edgeglow,varname:_glow_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1.718524,max:6;n:type:ShaderForge.SFN_Multiply,id:4671,x:32049,y:33357,varname:node_4671,prsc:2|A-1027-OUT,B-5210-OUT;n:type:ShaderForge.SFN_Time,id:7003,x:30903,y:32850,varname:node_7003,prsc:2;n:type:ShaderForge.SFN_TexCoord,id:1600,x:30876,y:33090,varname:node_1600,prsc:2,uv:0;n:type:ShaderForge.SFN_Append,id:1769,x:31568,y:32997,varname:node_1769,prsc:2|A-6077-OUT,B-9930-OUT;n:type:ShaderForge.SFN_Add,id:6077,x:31297,y:32931,varname:node_6077,prsc:2|A-9911-OUT,B-1600-UVOUT;n:type:ShaderForge.SFN_Add,id:5210,x:31984,y:33528,varname:node_5210,prsc:2|A-1381-R,B-9020-OUT,C-5596-OUT;n:type:ShaderForge.SFN_Step,id:2683,x:32650,y:32493,varname:node_2683,prsc:2|A-5179-OUT,B-6718-OUT;n:type:ShaderForge.SFN_Multiply,id:2320,x:32881,y:32326,varname:node_2320,prsc:2|A-9006-OUT,B-2683-OUT;n:type:ShaderForge.SFN_Multiply,id:9911,x:31122,y:32802,varname:node_9911,prsc:2|A-8641-OUT,B-7003-TSL;n:type:ShaderForge.SFN_Vector1,id:8641,x:30924,y:32760,varname:node_8641,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Subtract,id:9930,x:31218,y:33122,varname:node_9930,prsc:2|A-7003-TSL,B-1600-UVOUT;n:type:ShaderForge.SFN_RemapRange,id:9557,x:31825,y:32552,varname:node_9557,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:0|IN-5949-OUT;n:type:ShaderForge.SFN_Add,id:6718,x:32112,y:32557,varname:node_6718,prsc:2|A-9557-OUT,B-1381-R;n:type:ShaderForge.SFN_Multiply,id:171,x:32177,y:32833,varname:node_171,prsc:2|A-6718-OUT,B-9006-OUT;n:type:ShaderForge.SFN_Sin,id:385,x:31700,y:33802,varname:node_385,prsc:2|IN-7580-T;n:type:ShaderForge.SFN_Time,id:7580,x:31515,y:33820,varname:node_7580,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5596,x:31887,y:33790,varname:node_5596,prsc:2|A-385-OUT,B-7073-OUT,C-1381-R;n:type:ShaderForge.SFN_Vector1,id:7073,x:31735,y:33968,varname:node_7073,prsc:2,v1:2;proporder:5949-1381-7324-9457-9020;pass:END;sub:END;*/

Shader "burnnn" {
    Properties {
        _glow ("glow", Range(0, 1)) = 1
        _node_1381 ("node_1381", 2D) = "white" {}
        _tile ("tile", 2D) = "white" {}
        _node_9457 ("node_9457", 2D) = "white" {}
        _edgeglow ("edgeglow", Range(1, 6)) = 1.718524
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
            uniform float4 _TimeEditor;
            uniform float _glow;
            uniform sampler2D _node_1381; uniform float4 _node_1381_ST;
            uniform sampler2D _tile; uniform float4 _tile_ST;
            uniform sampler2D _node_9457; uniform float4 _node_9457_ST;
            uniform float _edgeglow;
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
                float4 _tile_var = tex2D(_tile,TRANSFORM_TEX(i.uv0, _tile));
                float4 node_7003 = _Time + _TimeEditor;
                float4 node_1769 = float4(((0.5*node_7003.r)+i.uv0),(node_7003.r-i.uv0));
                float4 _node_1381_var = tex2D(_node_1381,TRANSFORM_TEX(node_1769, _node_1381));
                float4 node_7580 = _Time + _TimeEditor;
                float node_9006 = (1.0 - _tile_var.r);
                float2 node_8476 = (((1.0 - _tile_var.g)*(_node_1381_var.r+_edgeglow+(sin(node_7580.g)*2.0*_node_1381_var.r)))*float2(saturate(((node_9006*((_glow*1.2+-0.6)+_node_1381_var.r))*0.6+-0.3)),0.0));
                float4 node_2931 = tex2D(_node_9457,TRANSFORM_TEX(node_8476, _node_9457));
                float3 finalColor = node_2931.rgb;
                float node_6718 = ((_glow*1.0+-1.0)+_node_1381_var.r);
                fixed4 finalRGBA = fixed4(finalColor,(node_9006*step(((node_6718*node_9006)*0.9+0.0),node_6718)));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
