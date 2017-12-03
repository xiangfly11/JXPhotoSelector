//
//  JXPhotoSelectorTool.m
//  JXPhotoSelector
//
//  Created by Jiaxiang Li on 2017/12/2.
//

#import "JXPhotoSelectorTool.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "JXPreDefine.h"
#import <Photos/Photos.h>
#import "JXAlbumModel.h"

@interface JXPhotoSelectorTool()
@property (nonatomic, strong) ALAssetsLibrary *assetLibrary;

@end

@implementation JXPhotoSelectorTool

static JXPhotoSelectorTool *tool = nil;

+(instancetype) sharePhotoSelectorTool {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[self alloc] init];
    });
    return tool;
}



#pragma mark -- Setter && Getter
-(ALAssetsLibrary *)assetLibrary {
    if (!_assetLibrary) {
        _assetLibrary = [[ALAssetsLibrary alloc] init];
    }
    return _assetLibrary;
}

#pragma mark -- Public Methods
-(BOOL) isAccessPhotoLibAuthorization {
    NSInteger status = [self authorizedStatus];
    
    return status == 3;
}

-(void) getCameraAlbumIncludeImages:(BOOL)includeImages includeVideos:(BOOL)includeVideos completion:(void (^)(JXAlbumModel *))completion failure:(void (^)(NSError *))failure{
    if (iOS8Later) {
        
    }else {
        [self.assetLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
            if ([group numberOfAssets] <= 0) {
                return ;
            }
            //判断是否是设备拍摄的
            if ([self isCameraAlbum:group]) {
                //将ALAssetGroup转换成JXAlbumModel
                JXAlbumModel *model = [self fetchAlbumModel:group];
                if (completion) {
                    completion(model);
                }
                *stop = YES;
            }
            
        } failureBlock:^(NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
    }
}

#pragma mark -- Private Methods

/**
 用户是否授权访问相册

 @return 授权访问相册的状态
 */
-(NSInteger) authorizedStatus {
    NSInteger status = 0;
    if (iOS8Later) {
        status = [PHPhotoLibrary authorizationStatus];
    }else {
        status = [ALAssetsLibrary authorizationStatus];
    }
    return status;
}

/**
 是否是用户拍摄的内容

 @param album 相册实例
 @return YES / NO
 */
-(BOOL) isCameraAlbum:(id)album {
    BOOL isCamera = NO;
    if ([album isKindOfClass:[ALAssetsGroup class]]) {
        ALAssetsGroup *group = album;
        isCamera = ([[group valueForProperty:ALAssetsGroupPropertyType] integerValue ] == ALAssetsGroupSavedPhotos);
    }else if ([album isKindOfClass:[PHFetchResult class]]) {
        PHFetchResult *result = album;
    }
    
    return isCamera;
}


/**
 将相册实例转换成JXAlbumModel

 @param album 相册实例
 @return JXAlbumModel 实例
 */
-(JXAlbumModel *) fetchAlbumModel:(id)album {
    JXAlbumModel *albumModel = [[JXAlbumModel alloc] init];
    if ([album isKindOfClass:[ALAssetsGroup class]]) {
        albumModel.albumName = [album valueForProperty:ALAssetsGroupPropertyName];
        albumModel.count = [album numberOfAssets];
        albumModel.isCamera = [self isCameraAlbum:album];
        albumModel.result = album;
    }else if ([album isKindOfClass:[PHFetchResult class]]) {
        
    }
    
    
    return albumModel;
}

@end
