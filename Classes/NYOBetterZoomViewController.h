//
//  NYOBetterZoomViewController.h
//  NYOBetterZoom
//
//  Created by Liam on 14/04/2010.
//  Copyright Liam Jones (nyoron.co.uk) 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NYOBetterUIScrollView.h"

@interface NYOBetterZoomViewController : UIViewController <UIScrollViewDelegate> {
	NYOBetterUIScrollView *_imageScrollView;
}

@property (nonatomic, retain) NYOBetterUIScrollView *imageScrollView;

@end

