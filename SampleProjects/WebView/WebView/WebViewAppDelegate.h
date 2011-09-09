//
//  WebViewAppDelegate.h
//  WebView
//
//  Created by Mac OS User on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebViewViewController;

@interface WebViewAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet WebViewViewController *viewController;

@end
