//
//  NYOBetterZoomAppDelegate.h
//  NYOBetterZoom
//
//  Created by Liam on 14/04/2010.
//  Copyright Liam Jones (nyoron.co.uk) 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NYOBetterZoomViewController;

@interface NYOBetterZoomAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    NYOBetterZoomViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet NYOBetterZoomViewController *viewController;

@end

