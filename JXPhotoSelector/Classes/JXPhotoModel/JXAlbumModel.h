//
//  JXAlbumModel.h
//  JXPhotoSelector
//
//  Created by Jiaxiang Li on 2017/12/3.
//

#import <Foundation/Foundation.h>

@interface JXAlbumModel : NSObject

/**
 相册的名字
 */
@property (nonatomic, strong) NSString *albumName;

/**
 相册实例 ALASsetGroup 或者  PHFetchResult
 */
@property (nonatomic, strong) id result;

/**
 相册中相片个数
 */
@property (nonatomic, assign) NSInteger count;

/**
 是否是设备拍摄的内容
 */
@property (nonatomic, assign) BOOL isCamera;
@end
