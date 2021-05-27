/********************************************************
 * @file    : TuSDKManager.h
 * @project : tusdkfilterprocessormodule
 * @author  : Copyright © http://tutucloud.com/
 * @date    : 2020-08-01
 * @brief   : 
*********************************************************/
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "TuSDKFramework.h"


@interface TuSDKManager : NSObject
@property (nonatomic, assign, readonly) BOOL isInitedTuSDK; // 是否初始化SDK
@property (nonatomic, assign, readonly) BOOL isInitFilterProcessor; // 是否初始化滤镜处理器

@property (nonatomic, assign) BOOL enableLiveSticker; // 是否开启动态贴纸 (默认: YES)



#pragma mark - 初始化
+ (instancetype)sharedManager;

/**
 *  初始化SDK
 *
 *  @param appKey 应用秘钥
 */
- (void)initSdkWithAppKey:(NSString *)appKey;

/**
 *  初始化SDK(多包名发布：https://tutucloud.com/docs/ios-faq/masterkey)
 *
 *  @param appKey 应用秘钥
 *  @param devType 开发模式(需要与lsq_tusdk_configs.json中masters.key匹配， 如果找不到devType将默认读取master字段)
 */
- (void)initSdkWithAppKey:(NSString *)appKey devType:(NSString *)devType;

/**
 *  布局TuSDK功能的相关视图，统一配置：滤镜+贴纸+美颜
 *  @param superView 滤镜视图需要展示的父视图，如果穿nil即不会默认添加上去，需要各自面板再添加到想要的view上
 */
- (void)configTuSDKViewWithSuperView:(UIView*)superView;

/**
 *  析构方法 --- 销毁滤镜
 */
- (void)destoryFilterProcessor;


#pragma mark - 帧数据处理
/**
 Process a video sample and return result soon
 
 @param pixelBuffer pixelBuffer pixelBuffer Buffer to process
 @return Video PixelBuffer
 */
- (CVPixelBufferRef)syncProcessPixelBuffer:(CVPixelBufferRef)pixelBuffer timeStamp:(int64_t)timeStamp;


@end


