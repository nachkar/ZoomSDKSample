//
//  ZMSDKHCPanelistsView.h
//  ZoomSDKSample
//
//  Created by derain on 17/12/2018.
//  Copyright © 2018 zoom.us. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ZMSDKHCPanelistsView : NSView <NSTableViewDataSource, NSTableViewDelegate>
{
    NSTableView*          _panelistTableView;
    NSMutableArray*       _panelistUserArray;//All user array
    NSMutableDictionary*  _timerUserArray;
}
- (void)initUserListArray;
- (void)onUserJoin:(unsigned int)userID;
- (void)onUserleft:(unsigned int)userID;
- (void)resetInfo;
- (void)timerUpdated:(unsigned int)userID;

@end
