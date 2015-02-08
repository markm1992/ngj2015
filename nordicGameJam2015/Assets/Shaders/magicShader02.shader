// Shader created with Shader Forge v1.03 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.03;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:True,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:2,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:4421,x:33836,y:32920,varname:node_4421,prsc:2|diff-5386-OUT;n:type:ShaderForge.SFN_Tex2d,id:1430,x:31913,y:32983,ptovrint:False,ptlb:node_1430,ptin:_node_1430,varname:node_1430,prsc:2,tex:5feadb05aa8792847ac66d50c3d9c941,ntxv:0,isnm:False|UVIN-1177-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1177,x:31576,y:33374,varname:node_1177,prsc:2,uv:0;n:type:ShaderForge.SFN_OneMinus,id:1767,x:32070,y:32967,varname:node_1767,prsc:2|IN-1430-RGB;n:type:ShaderForge.SFN_Multiply,id:1064,x:32281,y:33087,varname:node_1064,prsc:2|A-1767-OUT,B-9653-RGB,C-3748-OUT;n:type:ShaderForge.SFN_Subtract,id:7577,x:32737,y:32751,varname:node_7577,prsc:2|A-5517-OUT,B-1064-OUT;n:type:ShaderForge.SFN_Color,id:3823,x:31569,y:32375,ptovrint:False,ptlb:loRamp,ptin:_loRamp,varname:node_3823,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_FragmentPosition,id:7075,x:30779,y:32455,varname:node_7075,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:2786,x:31180,y:32512,varname:node_2786,prsc:2,frmn:0,frmx:15,tomn:0,tomx:1|IN-7075-Y;n:type:ShaderForge.SFN_Color,id:2846,x:31647,y:32168,ptovrint:False,ptlb:hiRamp,ptin:_hiRamp,varname:node_2846,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_OneMinus,id:2453,x:31924,y:32617,varname:node_2453,prsc:2|IN-9249-OUT;n:type:ShaderForge.SFN_Multiply,id:443,x:32122,y:32578,varname:node_443,prsc:2|A-3823-RGB,B-2453-OUT;n:type:ShaderForge.SFN_Add,id:5517,x:32328,y:32498,varname:node_5517,prsc:2|A-2331-OUT,B-443-OUT;n:type:ShaderForge.SFN_Multiply,id:2331,x:32027,y:32329,varname:node_2331,prsc:2|A-2846-RGB,B-9249-OUT;n:type:ShaderForge.SFN_Floor,id:8623,x:31007,y:32374,varname:node_8623,prsc:2|IN-7075-Y;n:type:ShaderForge.SFN_Vector1,id:8962,x:30936,y:32752,varname:node_8962,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2d,id:1448,x:32821,y:32922,ptovrint:False,ptlb:node_1448,ptin:_node_1448,varname:node_1448,prsc:2,ntxv:0,isnm:False|UVIN-9194-OUT;n:type:ShaderForge.SFN_Vector1,id:6424,x:32360,y:33480,varname:node_6424,prsc:2,v1:6;n:type:ShaderForge.SFN_Multiply,id:4156,x:32570,y:33319,varname:node_4156,prsc:2|A-1177-V,B-2769-OUT;n:type:ShaderForge.SFN_Multiply,id:6192,x:32486,y:33195,varname:node_6192,prsc:2|A-1177-U,B-2769-OUT;n:type:ShaderForge.SFN_Append,id:9194,x:32622,y:32962,varname:node_9194,prsc:2|A-6192-OUT,B-4156-OUT;n:type:ShaderForge.SFN_Multiply,id:5386,x:33069,y:32763,varname:node_5386,prsc:2|A-7577-OUT,B-1448-R;n:type:ShaderForge.SFN_ValueProperty,id:3748,x:32070,y:33210,ptovrint:False,ptlb:AOInfluence,ptin:_AOInfluence,varname:node_3748,prsc:2,glob:False,v1:0.3;n:type:ShaderForge.SFN_ValueProperty,id:2769,x:32210,y:33405,ptovrint:False,ptlb:repeatWaterColor,ptin:_repeatWaterColor,varname:node_2769,prsc:2,glob:False,v1:6;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:9292,x:31199,y:32688,varname:node_9292,prsc:2|IN-7075-Y,IMIN-6179-OUT,IMAX-5962-OUT,OMIN-8962-OUT,OMAX-6785-OUT;n:type:ShaderForge.SFN_Vector1,id:6785,x:30928,y:32816,varname:node_6785,prsc:2,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:6179,x:30888,y:32631,ptovrint:False,ptlb:rampMinY,ptin:_rampMinY,varname:node_6179,prsc:2,glob:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:5962,x:30904,y:32694,ptovrint:False,ptlb:rampMaxY,ptin:_rampMaxY,varname:node_5962,prsc:2,glob:False,v1:15;n:type:ShaderForge.SFN_Color,id:9653,x:31896,y:33154,ptovrint:False,ptlb:lightColor,ptin:_lightColor,varname:node_9653,prsc:2,glob:False,c1:0.7529412,c2:0.4196078,c3:0.05882353,c4:1;n:type:ShaderForge.SFN_Clamp01,id:9249,x:31390,y:32665,varname:node_9249,prsc:2|IN-9292-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:3934,x:32904,y:33100,varname:node_3934,prsc:2;n:type:ShaderForge.SFN_LightColor,id:6228,x:32885,y:33235,varname:node_6228,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4432,x:33141,y:33114,varname:node_4432,prsc:2|A-3934-OUT,B-6228-RGB;proporder:1430-3823-2846-1448-3748-2769-6179-5962-9653;pass:END;sub:END;*/

Shader "GoldiLocks/backGroundShader" {
    Properties {
        _node_1430 ("node_1430", 2D) = "white" {}
        _loRamp ("loRamp", Color) = (0.5,0.5,0.5,1)
        _hiRamp ("hiRamp", Color) = (0.5,0.5,0.5,1)
        _node_1448 ("node_1448", 2D) = "white" {}
        _AOInfluence ("AOInfluence", Float ) = 0.3
        _repeatWaterColor ("repeatWaterColor", Float ) = 6
        _rampMinY ("rampMinY", Float ) = 0
        _rampMaxY ("rampMaxY", Float ) = 15
        _lightColor ("lightColor", Color) = (0.7529412,0.4196078,0.05882353,1)
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
            #define SHOULD_SAMPLE_SH_PROBE ( defined (LIGHTMAP_OFF) )
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
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
            uniform float4 _LightColor0;
            uniform sampler2D _node_1430; uniform float4 _node_1430_ST;
            uniform float4 _loRamp;
            uniform float4 _hiRamp;
            uniform sampler2D _node_1448; uniform float4 _node_1448_ST;
            uniform float _AOInfluence;
            uniform float _repeatWaterColor;
            uniform float _rampMinY;
            uniform float _rampMaxY;
            uniform float4 _lightColor;
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
                float4 screenPos : TEXCOORD3;
                LIGHTING_COORDS(4,5)
                float3 shLight : TEXCOORD6;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                #if SHOULD_SAMPLE_SH_PROBE
                    o.shLight = ShadeSH9(float4(mul(_Object2World, float4(v.normal,0)).xyz * unity_Scale.w,1)) * 0.5;
                #endif
                o.normalDir = mul(_Object2World, float4(v.normal,0)).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                o.screenPos = o.pos;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
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
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 indirectDiffuse = float3(0,0,0);
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                #if SHOULD_SAMPLE_SH_PROBE
                    indirectDiffuse += i.shLight; // Per-Vertex Light Probes / Spherical harmonics
                #endif
                float node_8962 = 0.0;
                float node_9249 = saturate((node_8962 + ( (i.posWorld.g - _rampMinY) * (1.0 - node_8962) ) / (_rampMaxY - _rampMinY)));
                float4 _node_1430_var = tex2D(_node_1430,TRANSFORM_TEX(i.uv0, _node_1430));
                float2 node_9194 = float2((i.uv0.r*_repeatWaterColor),(i.uv0.g*_repeatWaterColor));
                float4 _node_1448_var = tex2D(_node_1448,TRANSFORM_TEX(node_9194, _node_1448));
                float3 diffuse = (directDiffuse + indirectDiffuse) * ((((_hiRamp.rgb*node_9249)+(_loRamp.rgb*(1.0 - node_9249)))-((1.0 - _node_1430_var.rgb)*_lightColor.rgb*_AOInfluence))*_node_1448_var.r);
/// Final Color:
                float3 finalColor = diffuse;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ForwardAdd"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            Fog { Color (0,0,0,0) }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #define SHOULD_SAMPLE_SH_PROBE ( defined (LIGHTMAP_OFF) )
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
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
            uniform float4 _LightColor0;
            uniform sampler2D _node_1430; uniform float4 _node_1430_ST;
            uniform float4 _loRamp;
            uniform float4 _hiRamp;
            uniform sampler2D _node_1448; uniform float4 _node_1448_ST;
            uniform float _AOInfluence;
            uniform float _repeatWaterColor;
            uniform float _rampMinY;
            uniform float _rampMaxY;
            uniform float4 _lightColor;
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
                float4 screenPos : TEXCOORD3;
                LIGHTING_COORDS(4,5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(_Object2World, float4(v.normal,0)).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                o.screenPos = o.pos;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
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
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float node_8962 = 0.0;
                float node_9249 = saturate((node_8962 + ( (i.posWorld.g - _rampMinY) * (1.0 - node_8962) ) / (_rampMaxY - _rampMinY)));
                float4 _node_1430_var = tex2D(_node_1430,TRANSFORM_TEX(i.uv0, _node_1430));
                float2 node_9194 = float2((i.uv0.r*_repeatWaterColor),(i.uv0.g*_repeatWaterColor));
                float4 _node_1448_var = tex2D(_node_1448,TRANSFORM_TEX(node_9194, _node_1448));
                float3 diffuse = directDiffuse * ((((_hiRamp.rgb*node_9249)+(_loRamp.rgb*(1.0 - node_9249)))-((1.0 - _node_1430_var.rgb)*_lightColor.rgb*_AOInfluence))*_node_1448_var.r);
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
