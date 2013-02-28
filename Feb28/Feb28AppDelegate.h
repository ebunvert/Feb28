//
//  Feb28AppDelegate.h
//  Feb28
//
//  Created by Eric Unvert on 2/28/13.
//  Copyright (c) 2013 Eric Unvert. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;         //SINCE I CREATED THE CLASS VIEW, I NEED TO DECLARE IT HERE

@interface Feb28AppDelegate : UIResponder <UIApplicationDelegate> {
    View *view;
    UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
