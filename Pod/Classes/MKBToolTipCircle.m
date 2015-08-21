//
//  MKBToolTipCircle.m
//  Sainsburys
//
//  Created by Mark Bridges on 31/07/2015.
//  Copyright (c) 2015 Sainsbury's. All rights reserved.
//

#import "MKBToolTipCircle.h"

@implementation MKBToolTipCircle

@synthesize circleColour = _circleColour;

- (void)dealloc
{
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(bounds))];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.backgroundColor = [UIColor clearColor];

    [self addObserver:self
           forKeyPath:NSStringFromSelector(@selector(bounds))
              options:NSKeyValueObservingOptionNew
              context:NULL];
}

- (UIColor*)circleColour
{
    if (_circleColour == nil)
    {
        _circleColour = [UIColor colorWithRed: 0.267 green: 0.267 blue: 0.267 alpha: 1]; // Default colour
    }
    
    return _circleColour;
}

- (void)setCircleColour:(UIColor *)circleColour
{
    _circleColour = circleColour;
    [self setNeedsDisplay];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGRect frame = rect;
    
    //// Subframes
    CGRect group = CGRectMake(CGRectGetMinX(frame) + floor(CGRectGetWidth(frame) * 0.03478 + 0.5), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.00435 + 0.5), floor(CGRectGetWidth(frame) * 0.96087 + 0.5) - floor(CGRectGetWidth(frame) * 0.03478 + 0.5), floor(CGRectGetHeight(frame) * 0.97391 + 0.5) - floor(CGRectGetHeight(frame) * 0.00435 + 0.5));
    
    
    //// Group
    {
        //// Page-1
        {
            //// Oval-628 Drawing
            UIBezierPath* oval628Path = UIBezierPath.bezierPath;
            [oval628Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.56710 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.04832 * CGRectGetHeight(group))];
            [oval628Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00000 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.54515 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.04551 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.50000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00000 * CGRectGetHeight(group))];
            [oval628Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43249 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.04837 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.50000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00000 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.45457 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.04552 * CGRectGetHeight(group))];
            [oval628Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.52203 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.18827 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.07988 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27994 * CGRectGetHeight(group))];
            [oval628Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50000 * CGRectGetWidth(group), CGRectGetMinY(group) + 1.00000 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.78600 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.22386 * CGRectGetWidth(group), CGRectGetMinY(group) + 1.00000 * CGRectGetHeight(group))];
            [oval628Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 1.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.52203 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.77614 * CGRectGetWidth(group), CGRectGetMinY(group) + 1.00000 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 1.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.78600 * CGRectGetHeight(group))];
            [oval628Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.56710 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.04832 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 1.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27980 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.81151 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.07966 * CGRectGetHeight(group))];
            [oval628Path closePath];
            oval628Path.miterLimit = 4;
            
            oval628Path.usesEvenOddFillRule = YES;
            
            [self.circleColour setFill];
            [oval628Path fill];
        }
    }
}

@end
