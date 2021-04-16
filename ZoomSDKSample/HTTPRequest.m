//
//  HTTPRequest.m
//  ZoomSDKSample
//
//  Created by Noel Achkar on 16/04/2021.
//  Copyright © 2021 Zoom. All rights reserved.
//

#import "HTTPRequest.h"
#import "AFNetworking.h"

@interface HTTPRequest ()
{
    NSInteger timeout;
}

@end

@implementation HTTPRequest

-(instancetype)init
{
    self = [super init];
    
    if(self)
    {
        timeout = 180;
    }
    
    return self;
}

-(void)setHeaders:(NSMutableURLRequest *)request
{
    [request setValue:@"multipart/form-data" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"*/*" forHTTPHeaderField:@"Accept"];
}

-(void)POST:(NSString *)url path:(NSString *)path success:(void (^)(id response))success failure:(void (^)(NSError *error))failure
{
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:path] name:@"file" fileName:@"meetingrec_0.mp4" mimeType:@"video/mp4" error:nil];
        } error:nil];

    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [(AFHTTPResponseSerializer*)manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects: @"text/json", @"text/plain",@"text/html",@"image/jpeg",@"multipart/form-data", nil]];
//    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager
                  uploadTaskWithStreamedRequest:request
                  progress:^(NSProgress * _Nonnull uploadProgress) {
                      // This is not called back on the main queue.
                      // You are responsible for dispatching to the main queue for UI updates
                      dispatch_async(dispatch_get_main_queue(), ^{
                          //Update the progress view
                      });
                  }
                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                      if (error) {
                          NSLog(@"Error: %@", error);
                      } else {
                          NSLog(@"%@ %@", response, responseObject);
                      }
                  }];

    [uploadTask resume];
}

@end
