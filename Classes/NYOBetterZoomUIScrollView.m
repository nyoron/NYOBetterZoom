//
//  NYOBetterUIScrollView.m
//  ZoomTest
//
//  Created by Liam on 14/04/2010.
//  Copyright 2010 Liam Jones (nyoron.co.uk). All rights reserved.
//

#import "NYOBetterZoomUIScrollView.h"


@implementation NYOBetterZoomUIScrollView


#pragma mark -
#pragma mark Initialisers


- (id)initWithFrame:(CGRect)aFrame {
    if ((self = [super initWithFrame:aFrame])) {
        // Initialization code
    }
    return self;
}


- (id)initWithChildView:(UIView *)aChildView {
	if (self = [super init]) {
        [self setChildView: aChildView];
    }
    return self;
}


- (id)initWithFrame:(CGRect)aFrame andChildView:(UIView *)aChildView  {
    if (self = [super initWithFrame:aFrame]) {
        [self setChildView: aChildView];
    }
    return self;
}


#pragma mark -
#pragma mark Accessors


- (UIView *)childView {
    return [[_childView retain] autorelease]; 
}


-(void)setChildView:(UIView *)aChildView {
	if (_childView != aChildView) {
		[_childView removeFromSuperview];
        [_childView release];
        _childView = [aChildView retain];
		[super addSubview:_childView];
		[self setContentOffset:CGPointZero];
    }
}


#pragma mark -
#pragma mark UIScrollView


// Rather than the default behaviour of a {0,0} offset when an image is too small to fill the UIScrollView we're going to return an offset that centres the image in the UIScrollView instead.
- (void)setContentOffset:(CGPoint)anOffset {
	if(_childView != nil) {
		CGSize zoomViewSize = _childView.frame.size;
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
	[_childView release], _childView = nil;

    [super dealloc];
}



// Warn the programmer if they're using regular subview methods (this subclass is only designed for zooming a single view)
#ifdef DEBUG
	#define SubviewMethodWarning() NSLog(@"%s warning - this class is only designed to work with a single subview via initWithFrame:andChildView: and/or the childView accessors. I won't stop you from calling this method but make sure you know the implications of what you're doing. ;)", __PRETTY_FUNCTION__);
#else
	#define SubviewMethodWarning()
#endif


- (void)addSubview:(UIView *)view {
	SubviewMethodWarning();
	[super addSubview:view];
}


- (void)exchangeSubviewAtIndex:(NSInteger)index1 withSubviewAtIndex:(NSInteger)index2 {
	SubviewMethodWarning();
	[super exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
}


- (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview {
	SubviewMethodWarning();
	[super insertSubview:view aboveSubview:siblingSubview];
}


- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index {
	SubviewMethodWarning();
	[super insertSubview:view atIndex:index];
}


- (void)insertSubview:(UIView *)view belowSubview:(UIView *)siblingSubview {
	SubviewMethodWarning();
	[super insertSubview:view belowSubview:siblingSubview];
}


@end
