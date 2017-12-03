//
//  JXPhotoSelectorTool.h
//  JXPhotoSelector
//
//  Created by Jiaxiang Li on 2017/12/2.
//

#import <Foundation/Foundation.h>
@class JXAlbumModel;
@interface JXPhotoSelectorTool : NSObject
/**
 创建单例

 @return 返回单例
 */
+(instancetype) sharePhotoSelectorTool;


/**
 获取用户授权信息

 @return YES->用户授权 NO->用户未授权
 */
-(BOOL) isAccessPhotoLibAuthorization;


/**
 获取相机库中用户用设备拍摄的照片

 @param includeImages 是否包含图片
 @param includeVideos 是否包含视频
 @param completion 完成的回调
 @param failure 失败的回调
 */
-(void)getCameraAlbumIncludeImages:(BOOL) includeImages includeVideos:(BOOL) includeVideos completion:(void(^)(JXAlbumModel * model)) completion failure:(void(^)(NSError *error)) failure;
@end
