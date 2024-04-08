// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:0,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:33312,y:32586,varname:node_2865,prsc:2|custl-3549-OUT,alpha-6767-OUT;n:type:ShaderForge.SFN_Tex2d,id:7324,x:32441,y:33017,ptovrint:False,ptlb:tile,ptin:_tile,varname:node_7324,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2d6efbb9549e4824195aa9a8fc90fbf9,ntxv:0,isnm:False;n:type:ShaderForge.SFN_OneMinus,id:9006,x:32771,y:32890,varname:node_9006,prsc:2|IN-7324-R;n:type:ShaderForge.SFN_Slider,id:9020,x:31845,y:32673,ptovrint:False,ptlb:glow,ptin:_glow,varname:_glow_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Color,id:5823,x:32748,y:32725,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_5823,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:2106,x:32933,y:32653,varname:node_2106,prsc:2|A-9020-OUT,B-5823-RGB;n:type:ShaderForge.SFN_Add,id:6767,x:33003,y:33023,varname:node_6767,prsc:2|A-9006-OUT,B-7141-OUT;n:type:ShaderForge.SFN_Multiply,id:7141,x:32783,y:33051,varname:node_7141,prsc:2|A-3483-OUT,B-7324-B;n:type:ShaderForge.SFN_Sin,id:2416,x:31795,y:32973,varname:node_2416,prsc:2|IN-8330-OUT;n:type:ShaderForge.SFN_Time,id:7466,x:31172,y:32930,varname:node_7466,prsc:2;n:type:ShaderForge.SFN_Divide,id:7841,x:31448,y:32990,varname:node_7841,prsc:2|A-7466-T,B-3837-OUT;n:type:ShaderForge.SFN_Vector1,id:3837,x:31205,y:33106,varname:node_3837,prsc:2,v1:2;n:type:ShaderForge.SFN_RemapRange,id:1661,x:31978,y:33004,varname:node_1661,prsc:2,frmn:0,frmx:1,tomn:0.5,tomx:1|IN-2416-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:8518,x:31395,y:33195,varname:node_8518,prsc:2;n:type:ShaderForge.SFN_Add,id:8330,x:31623,y:33120,varname:node_8330,prsc:2|A-7841-OUT,B-8518-X,C-8518-Y;n:type:ShaderForge.SFN_Multiply,id:3483,x:32242,y:32806,varname:node_3483,prsc:2|A-9020-OUT,B-1661-OUT;n:type:ShaderForge.SFN_Multiply,id:1394,x:32843,y:32457,varname:node_1394,prsc:2|A-4684-OUT,B-7324-B;n:type:ShaderForge.SFN_Add,id:3549,x:33118,y:32464,varname:node_3549,prsc:2|A-1394-OUT,B-2106-OUT;n:type:ShaderForge.SFN_Vector1,id:4684,x:32622,y:32473,varname:node_4684,prsc:2,v1:0.1;proporder:7324-9020-5823;pass:END;sub:END;*/

Shader "diamond" {
    Properties {
        _tile ("tile", 2D) = "white" {}
        _glow ("glow", Range(0, 1)) = 0
        _Color ("Color", Color) = (0,1,0,1)
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
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _tile; uniform float4 _tile_ST;
            uniform float _glow;
            uniform float4 _Color;
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
                float3 finalColor = ((0.1*_tile_var.b)+(_glow*_Color.rgb));
                float4 node_7466 = _Time + _TimeEditor;
                fixed4 finalRGBA = fixed4(finalColor,((1.0 - _tile_var.r)+((_glow*(sin(((node_7466.g/2.0)+i.posWorld.r+i.posWorld.g))*0.5+0.5))*_tile_var.b)));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
