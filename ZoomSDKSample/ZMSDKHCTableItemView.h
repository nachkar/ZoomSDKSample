//
//  ZMSDKHCTableItemView.h
//  ZoomSDKSample
//
//  Created by derain on 2018/12/4.
//  Copyright © 2018年 zoom.us. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ZMSDKHCTableItemView : NSTableRowView
{
    int                      _userId;
    int                      _time;
}
@property(assign)int userId;
@property(assign)int time;

- (void)setUserInfo:(int)userId withTime:(int)time;
- (void)updateUI;
- (void)updateState;

@end
