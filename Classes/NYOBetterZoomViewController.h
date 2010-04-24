//
//  NYOBetterZoomViewController.h
//  NYOBetterZoom
//
//  Created by Liam on 14/04/2010.
//  Copyright Liam Jones (nyoron.co.uk) 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NYOBetterZoomUIScrollView.h"

@interface NYOBetterZoomViewController : UIViewController <UIScrollViewDelegate> {
	NYOBetterZoomUIScrollView *_imageScrollView;
}

@property (nonatomic, retain) NYOBetterZoomUIScrollView *imageScrollView;

@end

