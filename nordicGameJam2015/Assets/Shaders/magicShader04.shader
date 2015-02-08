// Shader created with Shader Forge v1.03 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.03;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:0,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:2,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:5844,x:32753,y:32775,varname:node_5844,prsc:2|diff-5738-RGB,emission-5738-RGB,custl-1182-OUT;n:type:ShaderForge.SFN_Tex2d,id:5738,x:32287,y:32734,ptovrint:False,ptlb:node_5738,ptin:_node_5738,varname:node_5738,prsc:2,ntxv:0,isnm:False|UVIN-1892-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1892,x:32063,y:32695,varname:node_1892,prsc:2,uv:0;n:type:ShaderForge.SFN_LightVector,id:7102,x:31692,y:32995,varname:node_7102,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:4717,x:31676,y:33139,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:6839,x:31855,y:33016,varname:node_6839,prsc:2,dt:0|A-7102-OUT,B-4717-OUT;n:type:ShaderForge.SFN_LightColor,id:4092,x:32012,y:33390,varname:node_4092,prsc:2;n:type:ShaderForge.SFN_Vector1,id:1771,x:31773,y:32881,varname:node_1771,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Floor,id:6387,x:32261,y:32928,varname:node_6387,prsc:2|IN-9888-OUT;n:type:ShaderForge.SFN_Multiply,id:1182,x:32485,y:32979,varname:node_1182,prsc:2|A-1330-OUT,B-5976-OUT;n:type:ShaderForge.SFN_Vector1,id:1988,x:32112,y:33402,varname:node_1988,prsc:2,v1:0.02;n:type:ShaderForge.SFN_ConstantClamp,id:9888,x:32043,y:33057,varname:node_9888,prsc:2,min:0,max:1|IN-8204-OUT;n:type:ShaderForge.SFN_Add,id:8204,x:32012,y:32900,varname:node_8204,prsc:2|A-6839-OUT,B-1771-OUT;n:type:ShaderForge.SFN_Append,id:9282,x:32527,y:33150,varname:node_9282,prsc:2|A-1182-OUT,B-1988-OUT;n:type:ShaderForge.SFN_Multiply,id:5976,x:32286,y:33259,varname:node_5976,prsc:2|A-4092-RGB,B-1988-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:8656,x:32206,y:33057,varname:node_8656,prsc:2|IN-9888-OUT,IMIN-9625-OUT,IMAX-9901-OUT,OMIN-2746-OUT,OMAX-9901-OUT;n:type:ShaderForge.SFN_Vector1,id:9625,x:32028,y:33207,varname:node_9625,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Vector1,id:9901,x:32057,y:33263,varname:node_9901,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:2746,x:31889,y:33207,varname:node_2746,prsc:2,v1:0;n:type:ShaderForge.SFN_Clamp01,id:1330,x:32332,y:33078,varname:node_1330,prsc:2|IN-8656-OUT;proporder:5738;pass:END;sub:END;*/

Shader "Custom/magicShader04" {
    Properties {
        _node_5738 ("node_5738", 2D) = "white" {}
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
            uniform sampler2D _node_5738; uniform float4 _node_5738_ST;
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
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
////// Emissive:
                float4 _node_5738_var = tex2D(_node_5738,TRANSFORM_TEX(i.uv0, _node_5738));
                float3 emissive = _node_5738_var.rgb;
                float node_9625 = 0.8;
                float node_9901 = 1.0;
                float node_2746 = 0.0;
                float node_1988 = 0.02;
                float3 finalColor = emissive + (saturate((node_2746 + ( (clamp((dot(lightDirection,i.normalDir)+0.5),0,1) - node_9625) * (node_9901 - node_2746) ) / (node_9901 - node_9625)))*(_LightColor0.rgb*node_1988));
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
            uniform sampler2D _node_5738; uniform float4 _node_5738_ST;
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
                float node_9625 = 0.8;
                float node_9901 = 1.0;
                float node_2746 = 0.0;
                float node_1988 = 0.02;
                float3 finalColor = (saturate((node_2746 + ( (clamp((dot(lightDirection,i.normalDir)+0.5),0,1) - node_9625) * (node_9901 - node_2746) ) / (node_9901 - node_9625)))*(_LightColor0.rgb*node_1988));
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
