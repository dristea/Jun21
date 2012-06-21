//
//  Jun21AppDelegate.h
//  Jun21
//
//  Created by Dan Ristea on 6/20/12.
//  Copyright (c) 2012 NBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class View;

@interface Jun21AppDelegate : UIResponder <UIApplicationDelegate>{
	
	View *view;
	UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
