//
//  NYOBetterUIScrollView.m
//  ZoomTest
//
//  Created by Liam on 14/04/2010.
//  Copyright 2010 Liam Jones (nyoron.co.uk). All rights reserved.
//

#import "NYOBetterZoomUIScrollView.h"


@implementation NYOBetterZoomUIScrollView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}


// Rather than the default behaviour of a {0,0} offset when an image is too small to fill the UIScrollView we're going to return an offset that centres the image in the UIScrollView instead.
- (void)setContentOffset:(CGPoint)anOffset {
	UIView *zoomView = [self viewWithTag:ZOOM_VIEW_TAG];
	
	if(zoomView != nil) {
		CGSize zoomViewSize = zoomView.frame.size;
		CGSize scrollViewSize = self.bounds.size;
		
		if(zoomViewSize.width < scrollViewSize.width) {
			anOffset.x = -(scrollViewSize.width - zoomViewSize.width) / 2.0;
		}
		
		if(zoomViewSize.height < scrollViewSize.height) {
			anOffset.y = -(scrollViewSize.height - zoomViewSize.height) / 2.0;
		}
	}
	
	super.contentOffset = anOffset;
}


- (void)dealloc {
    [super dealloc];
}


@end
