//
//  NYOBetterZoomViewController.m
//  NYOBetterZoom
//
//  Created by Liam on 14/04/2010.
//  Copyright Liam Jones (nyoron.co.uk) 2010. All rights reserved.
//

#import "NYOBetterZoomViewController.h"

@implementation NYOBetterZoomViewController

@synthesize imageScrollView = _imageScrollView;


// Used to work out the minimum zoom, called when device rotates (as aspect ratio of ScrollView changes when this happens). Could become part of NYOBetterUIScrollView but put here for now as you may not want the same behaviour I do in this regard :)
- (void)setMinimumZoomForCurrentAspectRatio {
	UIImageView *imageView = ((UIImageView *)[self.imageScrollView viewWithTag:ZOOM_VIEW_TAG]);
	
	// We'll retain minimum zoom for the new aspect ratio if we were already at it
	BOOL wasAtMinimumZoom = NO;
	if(self.imageScrollView.zoomScale == self.imageScrollView.minimumZoomScale) {
		wasAtMinimumZoom = YES;
	}
	
	// Work out a nice minimum zoom for the image - if it's smaller than the ScrollView then 1.0x zoom otherwise a scaled down zoom so it fits in the ScrollView entirely when zoomed out
	CGSize imageSize = imageView.image.size;
	CGSize scrollSize = self.imageScrollView.frame.size;
	CGFloat widthRatio = scrollSize.width / imageSize.width;
	CGFloat heightRatio = scrollSize.height / imageSize.height;
	CGFloat minimumZoom = MIN(1.0, (widthRatio > heightRatio) ? heightRatio : widthRatio);
	
	[self.imageScrollView setMinimumZoomScale:minimumZoom];
	if(wasAtMinimumZoom || self.imageScrollView.zoomScale < minimumZoom) {
		[self.imageScrollView setZoomScale:minimumZoom animated:YES];
	}
}


- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Set up our custom ScrollView
	self.imageScrollView = [[NYOBetterZoomUIScrollView alloc] initWithFrame:self.view.bounds];
	[self.imageScrollView setBackgroundColor:[UIColor blackColor]];
	[self.imageScrollView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
	[self.imageScrollView setShowsVerticalScrollIndicator:NO];
	[self.imageScrollView setShowsHorizontalScrollIndicator:NO];
	[self.imageScrollView setBouncesZoom:YES];
	[self.imageScrollView setDelegate:self];
	[self.view addSubview:self.imageScrollView];
	
	// Set up the ImageView that's going inside our scroll view
	//UIImage *image = [UIImage imageNamed:@"big.png"];
	//UIImage *image = [UIImage imageNamed:@"fit-landscape.png"];
	//UIImage *image = [UIImage imageNamed:@"fit-portrait.png"];
	UIImage *image = [UIImage imageNamed:@"small.png"];
	//UIImage *image = [UIImage imageNamed:@"tall.png"];
	//UIImage *image = [UIImage imageNamed:@"wide.png"];
	UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
	
	// Need to make sure we set the ZOOM_VIEW_TAG on this view so the custom ScrollView can find it in setContentOffset:
	[imageView setTag:ZOOM_VIEW_TAG];
	
	
	// Finish the ScrollView setup
	[self.imageScrollView setContentSize:imageView.frame.size];
	[self.imageScrollView addSubview:imageView];
	[self.imageScrollView setMaximumZoomScale:2.0];
	[self setMinimumZoomForCurrentAspectRatio];
	[self.imageScrollView setZoomScale:self.imageScrollView.minimumZoomScale];
	
	// Trigger initial setOffset reposition otherwise a small image will turn up at {0,0} initially
	[self.imageScrollView setContentOffset:CGPointZero];
	
	[imageView release];
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)aScrollView {
	return [aScrollView viewWithTag:ZOOM_VIEW_TAG];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {	
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
	// Aspect ratio of ScrollView has changed, need to recalculate the minimum zoom
	[self setMinimumZoomForCurrentAspectRatio];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)viewDidUnload {
	self.imageScrollView = nil;
}


- (void)dealloc {
	[_imageScrollView release], _imageScrollView = nil;
    [super dealloc];
}

@end
