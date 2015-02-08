// Shader created with Shader Forge v1.03 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.03;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:3,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:2,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:6406,x:32719,y:32712,varname:node_6406,prsc:2|emission-9994-OUT,voffset-6139-OUT;n:type:ShaderForge.SFN_Vector3,id:9475,x:31904,y:32561,varname:node_9475,prsc:2,v1:0.9098039,v2:0.1098039,v3:0.02745098;n:type:ShaderForge.SFN_NormalVector,id:2580,x:31467,y:32238,prsc:2,pt:False;n:type:ShaderForge.SFN_Vector3,id:1595,x:31513,y:32533,varname:node_1595,prsc:2,v1:0.9176471,v2:0.8588235,v3:0.2352941;n:type:ShaderForge.SFN_Multiply,id:1194,x:31874,y:32400,varname:node_1194,prsc:2|A-8975-OUT,B-1595-OUT,C-9449-OUT,D-8360-R;n:type:ShaderForge.SFN_Add,id:9994,x:32069,y:32525,varname:node_9994,prsc:2|A-1194-OUT,B-9475-OUT;n:type:ShaderForge.SFN_Fresnel,id:8975,x:31641,y:32293,varname:node_8975,prsc:2|NRM-2580-OUT,EXP-8830-OUT;n:type:ShaderForge.SFN_Vector1,id:8830,x:31446,y:32447,varname:node_8830,prsc:2,v1:2;n:type:ShaderForge.SFN_Vector1,id:9449,x:31648,y:32589,varname:node_9449,prsc:2,v1:10;n:type:ShaderForge.SFN_Panner,id:9362,x:31540,y:32778,varname:node_9362,prsc:2,spu:1,spv:1|UVIN-513-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:513,x:31343,y:32694,varname:node_513,prsc:2,uv:0;n:type:ShaderForge.SFN_Tex2d,id:8360,x:31692,y:32771,ptovrint:False,ptlb:node_8360,ptin:_node_8360,varname:node_8360,prsc:2,ntxv:0,isnm:False|UVIN-9362-UVOUT;n:type:ShaderForge.SFN_VertexColor,id:4033,x:31576,y:32968,varname:node_4033,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7453,x:31977,y:32773,varname:node_7453,prsc:2|A-8360-R,B-4033-R,C-5215-OUT;n:type:ShaderForge.SFN_Vector1,id:7599,x:31932,y:33151,varname:node_7599,prsc:2,v1:0;n:type:ShaderForge.SFN_Append,id:6139,x:32418,y:32973,varname:node_6139,prsc:2|A-9248-OUT,B-7453-OUT,C-9248-OUT;n:type:ShaderForge.SFN_Vector1,id:7393,x:31343,y:32902,varname:node_7393,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Vector1,id:5215,x:31732,y:33027,varname:node_5215,prsc:2,v1:2;n:type:ShaderForge.SFN_Vector1,id:7839,x:31977,y:33006,varname:node_7839,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Multiply,id:9248,x:32156,y:32868,varname:node_9248,prsc:2|A-7453-OUT,B-7839-OUT;proporder:8360;pass:END;sub:END;*/

Shader "Custom/magicShader03" {
    Properties {
        _node_8360 ("node_8360", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            // Dithering function, to use with scene UVs (screen pixel coords)
            // 3x3 Bayer matrix, based on https://en.wikipedia.org/wiki/Ordered_dithering
            float BinaryDither3x3( float value, float2 sceneUVs ) {
                float3x3 mtx = float3x3(
                    float3( 3,  7,  4 )/10.0,
                    float3( 6,  1,  9 )/10.0,
                    float3( 2,  8,  5 )/10.0
                );
                float2 px = floor(_ScreenParams.xy * sceneUVs);
                int xSmp = fmod(px.x,3);
                int ySmp = fmod(px.y,3);
                float3 xVec = 1-saturate(abs(float3(0,1,2) - xSmp));
                float3 yVec = 1-saturate(abs(float3(0,1,2) - ySmp));
                float3 pxMult = float3( dot(mtx[0],yVec), dot(mtx[1],yVec), dot(mtx[2],yVec) );
                return round(value + dot(pxMult, xVec));
            }
            uniform float4 _TimeEditor;
            uniform sampler2D _node_8360; uniform float4 _node_8360_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 screenPos : TEXCOORD3;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = mul(_Object2World, float4(v.normal,0)).xyz;
                float4 node_7800 = _Time + _TimeEditor;
                float2 node_9362 = (o.uv0+node_7800.g*float2(1,1));
                float4 _node_8360_var = tex2Dlod(_node_8360,float4(TRANSFORM_TEX(node_9362, _node_8360),0.0,0));
                float node_7453 = (_node_8360_var.r*o.vertexColor.r*2.0);
                float node_9248 = (node_7453*0.2);
                v.vertex.xyz += float3(node_9248,node_7453,node_9248);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                o.screenPos = o.pos;
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 node_7800 = _Time + _TimeEditor;
                float2 node_9362 = (i.uv0+node_7800.g*float2(1,1));
                float4 _node_8360_var = tex2D(_node_8360,TRANSFORM_TEX(node_9362, _node_8360));
                float3 node_9475 = float3(0.9098039,0.1098039,0.02745098);
                float3 emissive = ((pow(1.0-max(0,dot(i.normalDir, viewDirection)),2.0)*float3(0.9176471,0.8588235,0.2352941)*10.0*_node_8360_var.r)+node_9475);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCollector"
            Tags {
                "LightMode"="ShadowCollector"
            }
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCOLLECTOR
            #define SHADOW_COLLECTOR_PASS
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcollector
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            // Dithering function, to use with scene UVs (screen pixel coords)
            // 3x3 Bayer matrix, based on https://en.wikipedia.org/wiki/Ordered_dithering
            float BinaryDither3x3( float value, float2 sceneUVs ) {
                float3x3 mtx = float3x3(
                    float3( 3,  7,  4 )/10.0,
                    float3( 6,  1,  9 )/10.0,
                    float3( 2,  8,  5 )/10.0
                );
                float2 px = floor(_ScreenParams.xy * sceneUVs);
                int xSmp = fmod(px.x,3);
                int ySmp = fmod(px.y,3);
                float3 xVec = 1-saturate(abs(float3(0,1,2) - xSmp));
                float3 yVec = 1-saturate(abs(float3(0,1,2) - ySmp));
                float3 pxMult = float3( dot(mtx[0],yVec), dot(mtx[1],yVec), dot(mtx[2],yVec) );
                return round(value + dot(pxMult, xVec));
            }
            uniform float4 _TimeEditor;
            uniform sampler2D _node_8360; uniform float4 _node_8360_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_COLLECTOR;
                float2 uv0 : TEXCOORD5;
                float4 screenPos : TEXCOORD6;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                float4 node_585 = _Time + _TimeEditor;
                float2 node_9362 = (o.uv0+node_585.g*float2(1,1));
                float4 _node_8360_var = tex2Dlod(_node_8360,float4(TRANSFORM_TEX(node_9362, _node_8360),0.0,0));
                float node_7453 = (_node_8360_var.r*o.vertexColor.r*2.0);
                float node_9248 = (node_7453*0.2);
                v.vertex.xyz += float3(node_9248,node_7453,node_9248);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                o.screenPos = o.pos;
                TRANSFER_SHADOW_COLLECTOR(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
/////// Vectors:
                SHADOW_COLLECTOR_FRAGMENT(i)
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Cull Off
            Offset 1, 1
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            // Dithering function, to use with scene UVs (screen pixel coords)
            // 3x3 Bayer matrix, based on https://en.wikipedia.org/wiki/Ordered_dithering
            float BinaryDither3x3( float value, float2 sceneUVs ) {
                float3x3 mtx = float3x3(
                    float3( 3,  7,  4 )/10.0,
                    float3( 6,  1,  9 )/10.0,
                    float3( 2,  8,  5 )/10.0
                );
                float2 px = floor(_ScreenParams.xy * sceneUVs);
                int xSmp = fmod(px.x,3);
                int ySmp = fmod(px.y,3);
                float3 xVec = 1-saturate(abs(float3(0,1,2) - xSmp));
                float3 yVec = 1-saturate(abs(float3(0,1,2) - ySmp));
                float3 pxMult = float3( dot(mtx[0],yVec), dot(mtx[1],yVec), dot(mtx[2],yVec) );
                return round(value + dot(pxMult, xVec));
            }
            uniform float4 _TimeEditor;
            uniform sampler2D _node_8360; uniform float4 _node_8360_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 screenPos : TEXCOORD2;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                float4 node_1333 = _Time + _TimeEditor;
                float2 node_9362 = (o.uv0+node_1333.g*float2(1,1));
                float4 _node_8360_var = tex2Dlod(_node_8360,float4(TRANSFORM_TEX(node_9362, _node_8360),0.0,0));
                float node_7453 = (_node_8360_var.r*o.vertexColor.r*2.0);
                float node_9248 = (node_7453*0.2);
                v.vertex.xyz += float3(node_9248,node_7453,node_9248);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                o.screenPos = o.pos;
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
/////// Vectors:
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
