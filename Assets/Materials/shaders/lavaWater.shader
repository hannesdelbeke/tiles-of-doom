// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:0,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:33127,y:32703,varname:node_2865,prsc:2|custl-6710-OUT;n:type:ShaderForge.SFN_Tex2d,id:7324,x:31926,y:33536,varname:node_7324,prsc:2,tex:6d92c57a45d595f4797f9be34ca1a343,ntxv:0,isnm:False|UVIN-4600-OUT,TEX-6877-TEX;n:type:ShaderForge.SFN_Lerp,id:4580,x:32781,y:32877,varname:node_4580,prsc:2|A-7080-RGB,B-3241-RGB,T-3456-OUT;n:type:ShaderForge.SFN_Color,id:7080,x:32560,y:32264,ptovrint:False,ptlb:node_7080,ptin:_node_7080,varname:node_7080,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:3241,x:32507,y:32477,ptovrint:False,ptlb:node_3241,ptin:_node_3241,varname:node_3241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Time,id:2705,x:30956,y:33527,varname:node_2705,prsc:2;n:type:ShaderForge.SFN_TexCoord,id:1402,x:31185,y:33620,varname:node_1402,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:4600,x:31545,y:33428,varname:node_4600,prsc:2|A-5252-OUT,B-1402-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:8617,x:31978,y:33769,varname:_node_7324_copy,prsc:2,tex:6d92c57a45d595f4797f9be34ca1a343,ntxv:0,isnm:False|TEX-6877-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:6877,x:30177,y:33182,ptovrint:False,ptlb:texture,ptin:_texture,varname:node_6877,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6d92c57a45d595f4797f9be34ca1a343,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:8058,x:31717,y:33732,varname:node_8058,prsc:2|A-5501-OUT,B-1547-OUT;n:type:ShaderForge.SFN_Vector1,id:1547,x:31539,y:33783,varname:node_1547,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Slider,id:4150,x:30635,y:33418,ptovrint:False,ptlb:node_4150,ptin:_node_4150,varname:node_4150,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:5252,x:31321,y:33348,varname:node_5252,prsc:2|A-4150-OUT,B-2705-TSL;n:type:ShaderForge.SFN_Subtract,id:5501,x:31528,y:33603,varname:node_5501,prsc:2|A-5252-OUT,B-1402-UVOUT;n:type:ShaderForge.SFN_Multiply,id:8942,x:32285,y:33592,varname:node_8942,prsc:2|A-7324-R,B-8617-R;n:type:ShaderForge.SFN_Tex2d,id:3495,x:30779,y:32465,ptovrint:False,ptlb:flowmap,ptin:_flowmap,varname:node_3495,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:19ea44b04d04dd3459ccf6fc224e0226,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ComponentMask,id:9708,x:30969,y:32465,varname:node_9708,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-3495-RGB;n:type:ShaderForge.SFN_RemapRange,id:4141,x:31199,y:32465,varname:node_4141,prsc:2,frmn:0,frmx:1,tomn:-0.5,tomx:0.5|IN-9708-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9018,x:30927,y:32678,ptovrint:False,ptlb:flowpower,ptin:_flowpower,varname:node_9018,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:2050,x:30927,y:32753,varname:node_2050,prsc:2,v1:-1;n:type:ShaderForge.SFN_Multiply,id:5990,x:31180,y:32665,varname:node_5990,prsc:2|A-9018-OUT,B-2050-OUT;n:type:ShaderForge.SFN_Multiply,id:3316,x:31377,y:32542,varname:node_3316,prsc:2|A-4141-OUT,B-5990-OUT;n:type:ShaderForge.SFN_Multiply,id:9068,x:31565,y:32478,varname:node_9068,prsc:2|A-3316-OUT,B-5725-OUT;n:type:ShaderForge.SFN_Multiply,id:434,x:31565,y:32662,varname:node_434,prsc:2|A-3316-OUT,B-80-OUT;n:type:ShaderForge.SFN_Frac,id:5725,x:31339,y:32784,varname:node_5725,prsc:2|IN-2223-OUT;n:type:ShaderForge.SFN_Multiply,id:2223,x:31159,y:32822,varname:node_2223,prsc:2|A-6187-TSL,B-2087-OUT;n:type:ShaderForge.SFN_Time,id:6187,x:30883,y:32810,varname:node_6187,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:2087,x:30705,y:32881,ptovrint:False,ptlb:flowspeed,ptin:_flowspeed,varname:_flowpower_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Vector1,id:1404,x:30491,y:32903,varname:node_1404,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:1232,x:31329,y:32929,varname:node_1232,prsc:2|A-2223-OUT,B-1404-OUT;n:type:ShaderForge.SFN_Frac,id:80,x:31546,y:32832,varname:node_80,prsc:2|IN-1232-OUT;n:type:ShaderForge.SFN_Subtract,id:279,x:31546,y:32966,varname:node_279,prsc:2|A-5022-OUT,B-5725-OUT;n:type:ShaderForge.SFN_Vector1,id:5022,x:31432,y:33109,varname:node_5022,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Divide,id:4917,x:31708,y:32982,varname:node_4917,prsc:2|A-279-OUT,B-5022-OUT;n:type:ShaderForge.SFN_Add,id:7292,x:31771,y:32725,varname:node_7292,prsc:2|A-4600-OUT,B-434-OUT;n:type:ShaderForge.SFN_Add,id:9219,x:31771,y:32492,varname:node_9219,prsc:2|A-915-UVOUT,B-9068-OUT;n:type:ShaderForge.SFN_Tex2d,id:621,x:31984,y:32558,varname:node_7324,prsc:2,tex:6d92c57a45d595f4797f9be34ca1a343,ntxv:0,isnm:False|UVIN-9219-OUT,TEX-6877-TEX;n:type:ShaderForge.SFN_Tex2d,id:5014,x:31984,y:32803,varname:_node_5572_copy,prsc:2,tex:6d92c57a45d595f4797f9be34ca1a343,ntxv:0,isnm:False|UVIN-7292-OUT,TEX-6877-TEX;n:type:ShaderForge.SFN_Lerp,id:3456,x:32289,y:32908,varname:node_3456,prsc:2|A-621-R,B-5014-R,T-8854-OUT;n:type:ShaderForge.SFN_Abs,id:8854,x:31897,y:32982,varname:node_8854,prsc:2|IN-4917-OUT;n:type:ShaderForge.SFN_TexCoord,id:915,x:31554,y:32289,varname:node_915,prsc:2,uv:0;n:type:ShaderForge.SFN_Tex2d,id:8092,x:31947,y:32348,varname:node_7324,prsc:2,tex:6d92c57a45d595f4797f9be34ca1a343,ntxv:0,isnm:False|TEX-6877-TEX;n:type:ShaderForge.SFN_Multiply,id:5060,x:32451,y:32746,varname:node_5060,prsc:2|B-3456-OUT;n:type:ShaderForge.SFN_Color,id:6263,x:32364,y:33143,ptovrint:False,ptlb:edgeblend,ptin:_edgeblend,varname:_node_7080_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5,c3:0,c4:1;n:type:ShaderForge.SFN_Lerp,id:6710,x:32866,y:33083,varname:node_6710,prsc:2|A-4580-OUT,B-6263-RGB,T-8617-G;proporder:7080-3241-6877-4150-3495-9018-2087-6263;pass:END;sub:END;*/

Shader "lavawater" {
    Properties {
        _node_7080 ("node_7080", Color) = (1,0.5,0,1)
        _node_3241 ("node_3241", Color) = (0.5,0.5,0.5,1)
        _texture ("texture", 2D) = "white" {}
        _node_4150 ("node_4150", Range(0, 1)) = 0
        _flowmap ("flowmap", 2D) = "white" {}
        _flowpower ("flowpower", Float ) = 0.5
        _flowspeed ("flowspeed", Float ) = 1
        _edgeblend ("edgeblend", Color) = (1,0.5,0,1)
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
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _node_7080;
            uniform float4 _node_3241;
            uniform sampler2D _texture; uniform float4 _texture_ST;
            uniform float _node_4150;
            uniform sampler2D _flowmap; uniform float4 _flowmap_ST;
            uniform float _flowpower;
            uniform float _flowspeed;
            uniform float4 _edgeblend;
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
                float4 _flowmap_var = tex2D(_flowmap,TRANSFORM_TEX(i.uv0, _flowmap));
                float2 node_3316 = ((_flowmap_var.rgb.rg*1.0+-0.5)*(_flowpower*(-1.0)));
                float4 node_6187 = _Time + _TimeEditor;
                float node_2223 = (node_6187.r*_flowspeed);
                float node_5725 = frac(node_2223);
                float2 node_9219 = (i.uv0+(node_3316*node_5725));
                float4 node_7324 = tex2D(_texture,TRANSFORM_TEX(node_9219, _texture));
                float4 node_2705 = _Time + _TimeEditor;
                float node_5252 = (_node_4150*node_2705.r);
                float2 node_4600 = (node_5252+i.uv0);
                float2 node_7292 = (node_4600+(node_3316*frac((node_2223+0.5))));
                float4 _node_5572_copy = tex2D(_texture,TRANSFORM_TEX(node_7292, _texture));
                float node_5022 = 0.5;
                float node_3456 = lerp(node_7324.r,_node_5572_copy.r,abs(((node_5022-node_5725)/node_5022)));
                float4 _node_7324_copy = tex2D(_texture,TRANSFORM_TEX(i.uv0, _texture));
                float3 finalColor = lerp(lerp(_node_7080.rgb,_node_3241.rgb,node_3456),_edgeblend.rgb,_node_7324_copy.g);
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
