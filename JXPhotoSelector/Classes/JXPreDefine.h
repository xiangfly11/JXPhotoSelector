//
//  JXPreDefine.h
//  JXPhotoSelector
//
//  Created by Jiaxiang Li on 2017/12/2.
//

#import <Foundation/Foundation.h>

#define iOS8Later ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
#define iOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)
#define iOS10Later ([UIDevice currentDevice].systemVersion.floatValue >= 10.0f)
#define iOS11Later ([UIDevice currentDevice].systemVersion.floatValue >=11.0f)
#define DEVICE_SCREEN_SCALE (IS_IPHONE ? (IS_IPHONE6_PLUS ? 1.1 : 1) : 1.5)


@interface JXPreDefine : NSObject

@end
