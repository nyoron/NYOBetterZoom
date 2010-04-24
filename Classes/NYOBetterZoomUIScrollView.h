//
//  NYOBetterUIScrollView.h
//  ZoomTest
//
//  Created by Liam on 14/04/2010.
//  Copyright 2010 Liam Jones (nyoron.co.uk). All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NYOBetterZoomUIScrollView : UIScrollView {
	UIView *_childView;	// I wanted to use _contentView but Apple got there first ;9
}

@property (nonatomic, retain) IBOutlet UIView *childView;

- (id)initWithChildView:(UIView *)aChildView;
- (id)initWithFrame:(CGRect)aFrame andChildView:(UIView *)aChildView;


@end
