// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:2,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33357,y:32810,varname:node_3138,prsc:2|diff-1901-OUT,normal-8650-RGB,emission-1803-OUT,amdfl-1803-OUT,custl-1901-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32065,y:33141,ptovrint:False,ptlb:glow,ptin:_glow,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;n:type:ShaderForge.SFN_Tex2d,id:8439,x:31885,y:33006,ptovrint:False,ptlb:node_8439,ptin:_node_8439,varname:node_8439,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0cd5d7c7d952b1146b33a3549ab96904,ntxv:0,isnm:False;n:type:ShaderForge.SFN_FragmentPosition,id:6409,x:31575,y:33188,varname:node_6409,prsc:2;n:type:ShaderForge.SFN_Slider,id:4162,x:31472,y:33410,ptovrint:False,ptlb:startheight,ptin:_startheight,varname:node_4162,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:4,cur:4,max:10;n:type:ShaderForge.SFN_Add,id:2305,x:31826,y:33293,varname:node_2305,prsc:2|A-6409-Y,B-4162-OUT;n:type:ShaderForge.SFN_Multiply,id:2874,x:32065,y:33375,varname:node_2874,prsc:2|A-2305-OUT,B-1364-OUT;n:type:ShaderForge.SFN_Slider,id:1364,x:31484,y:33524,ptovrint:False,ptlb:gradient length,ptin:_gradientlength,varname:_node_4162_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:0.01,max:0.3;n:type:ShaderForge.SFN_OneMinus,id:9670,x:32418,y:33284,varname:node_9670,prsc:2|IN-483-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:483,x:32235,y:33284,varname:node_483,prsc:2,min:0,max:1|IN-2874-OUT;n:type:ShaderForge.SFN_Lerp,id:1901,x:33153,y:33123,varname:node_1901,prsc:2|A-3257-OUT,B-7241-RGB,T-1331-OUT;n:type:ShaderForge.SFN_Tex2d,id:1903,x:32297,y:32692,varname:node_1903,prsc:2,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-9384-OUT,TEX-5686-TEX;n:type:ShaderForge.SFN_TexCoord,id:5609,x:31380,y:32656,varname:node_5609,prsc:2,uv:0;n:type:ShaderForge.SFN_Time,id:8869,x:31156,y:32490,varname:node_8869,prsc:2;n:type:ShaderForge.SFN_Add,id:9384,x:31831,y:32614,varname:node_9384,prsc:2|A-8869-TSL,B-5609-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6740,x:32540,y:32714,varname:node_6740,prsc:2|A-1903-RGB,B-9670-OUT,C-7630-RGB,D-7241-A,E-5050-OUT;n:type:ShaderForge.SFN_Add,id:1331,x:32792,y:32762,varname:node_1331,prsc:2|A-6740-OUT,B-9670-OUT;n:type:ShaderForge.SFN_Tex2d,id:7630,x:32312,y:32342,varname:_node_1903_copy,prsc:2,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-5958-OUT,TEX-5686-TEX;n:type:ShaderForge.SFN_Vector1,id:8314,x:31156,y:32289,varname:node_8314,prsc:2,v1:25;n:type:ShaderForge.SFN_Divide,id:5548,x:31365,y:32271,varname:node_5548,prsc:2|A-8314-OUT,B-8869-T;n:type:ShaderForge.SFN_Tex2dAsset,id:5686,x:32017,y:32484,ptovrint:False,ptlb:node_5686,ptin:_node_5686,varname:node_5686,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:349,x:32051,y:32814,ptovrint:False,ptlb:color,ptin:_color,varname:node_349,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:3257,x:32564,y:32942,varname:node_3257,prsc:2|A-349-RGB,B-8439-RGB;n:type:ShaderForge.SFN_Multiply,id:1803,x:32777,y:33161,varname:node_1803,prsc:2|A-1331-OUT,B-7241-RGB;n:type:ShaderForge.SFN_RemapRange,id:4334,x:32219,y:33022,varname:node_4334,prsc:2,frmn:0,frmx:1,tomn:0,tomx:4|IN-8439-R;n:type:ShaderForge.SFN_Clamp01,id:5050,x:32393,y:33040,varname:node_5050,prsc:2|IN-4334-OUT;n:type:ShaderForge.SFN_Tex2d,id:8650,x:32888,y:33385,ptovrint:False,ptlb:normal,ptin:_normal,varname:node_8650,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-5609-UVOUT;n:type:ShaderForge.SFN_Subtract,id:5958,x:31755,y:32321,varname:node_5958,prsc:2|A-8869-TSL,B-5609-UVOUT;proporder:7241-8439-4162-1364-5686-349-8650;pass:END;sub:END;*/

Shader "Shader Forge/lavawall" {
    Properties {
        _glow ("glow", Color) = (0.07843138,0.3921569,0.7843137,1)
        _node_8439 ("node_8439", 2D) = "white" {}
        _startheight ("startheight", Range(4, 10)) = 4
        _gradientlength ("gradient length", Range(0.01, 0.3)) = 0.01
        _node_5686 ("node_5686", 2D) = "white" {}
        _color ("color", Color) = (0.5,0.5,0.5,1)
        _normal ("normal", 2D) = "white" {}
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
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform float4 _glow;
            uniform sampler2D _node_8439; uniform float4 _node_8439_ST;
            uniform float _startheight;
            uniform float _gradientlength;
            uniform sampler2D _node_5686; uniform float4 _node_5686_ST;
            uniform float4 _color;
            uniform sampler2D _normal; uniform float4 _normal_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 _normal_var = tex2D(_normal,TRANSFORM_TEX(i.uv0, _normal));
                float3 normalLocal = _normal_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 node_8869 = _Time + _TimeEditor;
                float2 node_9384 = (node_8869.r+i.uv0);
                float4 node_1903 = tex2D(_node_5686,TRANSFORM_TEX(node_9384, _node_5686));
                float node_9670 = (1.0 - clamp(((i.posWorld.g+_startheight)*_gradientlength),0,1));
                float2 node_5958 = (node_8869.r-i.uv0);
                float4 _node_1903_copy = tex2D(_node_5686,TRANSFORM_TEX(node_5958, _node_5686));
                float4 _node_8439_var = tex2D(_node_8439,TRANSFORM_TEX(i.uv0, _node_8439));
                float3 node_1331 = ((node_1903.rgb*node_9670*_node_1903_copy.rgb*_glow.a*saturate((_node_8439_var.r*4.0+0.0)))+node_9670);
                float3 node_1803 = (node_1331*_glow.rgb);
                indirectDiffuse += node_1803; // Diffuse Ambient Light
                float3 node_1901 = lerp((_color.rgb*_node_8439_var.rgb),_glow.rgb,node_1331);
                float3 diffuseColor = node_1901;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = node_1803;
/// Final Color:
                float3 finalColor = diffuse + emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform float4 _glow;
            uniform sampler2D _node_8439; uniform float4 _node_8439_ST;
            uniform float _startheight;
            uniform float _gradientlength;
            uniform sampler2D _node_5686; uniform float4 _node_5686_ST;
            uniform float4 _color;
            uniform sampler2D _normal; uniform float4 _normal_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 _normal_var = tex2D(_normal,TRANSFORM_TEX(i.uv0, _normal));
                float3 normalLocal = _normal_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _node_8439_var = tex2D(_node_8439,TRANSFORM_TEX(i.uv0, _node_8439));
                float4 node_8869 = _Time + _TimeEditor;
                float2 node_9384 = (node_8869.r+i.uv0);
                float4 node_1903 = tex2D(_node_5686,TRANSFORM_TEX(node_9384, _node_5686));
                float node_9670 = (1.0 - clamp(((i.posWorld.g+_startheight)*_gradientlength),0,1));
                float2 node_5958 = (node_8869.r-i.uv0);
                float4 _node_1903_copy = tex2D(_node_5686,TRANSFORM_TEX(node_5958, _node_5686));
                float3 node_1331 = ((node_1903.rgb*node_9670*_node_1903_copy.rgb*_glow.a*saturate((_node_8439_var.r*4.0+0.0)))+node_9670);
                float3 node_1901 = lerp((_color.rgb*_node_8439_var.rgb),_glow.rgb,node_1331);
                float3 diffuseColor = node_1901;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
