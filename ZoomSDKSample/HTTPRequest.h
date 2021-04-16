//
//  HTTPRequest.h
//  ZoomSDKSample
//
//  Created by Noel Achkar on 16/04/2021.
//  Copyright © 2021 Zoom. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTTPRequest : NSObject

-(void)POST:(NSString *)url path:(NSString *)path success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
