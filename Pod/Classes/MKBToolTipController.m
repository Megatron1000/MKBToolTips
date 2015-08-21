//
//  MKBToolTipController.m
//  Mark Bridges
//
//  Created by Mark Bridges on 30/07/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import "MKBToolTipController.h"
#import "MKBToolTipView.h"
#import <PureLayout/ALView+PureLayout.h>
#import "UIView+MKBAdditions.h"

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

static CGSize toolTipSize = {150, 150};
static CGFloat distanceFromView = 20;

@interface MKBToolTipController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UIView *view;

@end

@implementation MKBToolTipController

+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark Getters & Setters

- (UIWindow *)window
{
    if (_window == nil)
    {
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
        [_window autoSetDimensionsToSize:[UIScreen mainScreen].bounds.size];
        _window.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _window.windowLevel = UIWindowLevelAlert;
        _window.backgroundColor = [UIColor clearColor];
    }
    
    return _window;
}

- (UIView*)view
{
    if (_view == nil)
    {
        [self.window addSubview:[[UIView alloc]initForAutoLayout]];
        _view = self.window.subviews.firstObject;
        _view.backgroundColor = [UIColor clearColor];
        [_view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        [_view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backgroundTapped:)]];
    }
    
    return _view;
}

#pragma mark The Methods

+ (void)showToolTipForView:(UIView*)view atAngle:(float)angle withText:(NSAttributedString*)text
{
    CGPoint point = [view.superview convertPoint:view.center toView:[view topMostSuperview]];// [UIApplication sharedApplication].keyWindow.rootViewController.view];
    
    [MKBToolTipController showToolTipFromPoint:point withDistance:(view.frame.size.height / 2) + distanceFromView atAngle:angle withText:text];
}

+ (void)showToolTipForBarButton:(UIBarButtonItem*)barButton atAngle:(float)angle withText:(NSAttributedString*)text
{
    UIView *barButtonView = (UIView *)[barButton performSelector:@selector(view)];

    [MKBToolTipController showToolTipForView:barButtonView atAngle:angle withText:text];
}

+ (void)showToolTipFromPoint:(CGPoint)point withDistance:(CGFloat)distanceFromPoint atAngle:(float)angle withText:(NSAttributedString*)text
{
    UIView *view = [MKBToolTipController sharedInstance].view;
    
    MKBToolTipView *toolTipView = [[NSBundle mainBundle]loadNibNamed:@"MKBToolTipView" owner:self options:nil].firstObject;
    [view addSubview:toolTipView];
    [toolTipView autoSetDimensionsToSize:toolTipSize];
    toolTipView.tipLabel.attributedText = text;
    toolTipView.leftLayoutConstraint = [toolTipView autoConstrainAttribute:ALAttributeLeft toAttribute:ALAttributeLeft ofView:toolTipView.superview];
    toolTipView.topLayoutConstraint = [toolTipView autoConstrainAttribute:ALAttributeTop toAttribute:ALAttributeTop ofView:toolTipView.superview];
    [self positionTipView:toolTipView atCenter:CGPointAtAngleOnCircle((toolTipSize.height / 2) + distanceFromPoint, angle, point)];
    [toolTipView rotateCircleToAngle:angle];
    
    [MKBToolTipController sharedInstance].window.userInteractionEnabled = YES;
    [MKBToolTipController sharedInstance].view.userInteractionEnabled = YES;
    
    toolTipView.transform = CGAffineTransformMakeScale(0, 0);
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toolTipView.alpha = 1;
                         toolTipView.transform = CGAffineTransformIdentity;
                     } completion:^(BOOL finished) {}];
}

+ (void)positionTipView:(MKBToolTipView *)toolTipView atCenter:(CGPoint)center
{
    toolTipView.leftLayoutConstraint.constant = center.x - (toolTipSize.width / 2);
    toolTipView.topLayoutConstraint.constant = center.y - (toolTipSize.height / 2);
}

- (void)backgroundTapped:(id)sender
{
    [self dismiss];
}

- (void)dismiss
{
    __weak typeof(self) weakSelf = self;
    
    self.window.userInteractionEnabled = NO;
    self.view.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         weakSelf.view.alpha = 0;
                     } completion:^(BOOL finished){
                         [weakSelf.view removeFromSuperview];
                         weakSelf.view = nil;
                         [[NSNotificationCenter defaultCenter] postNotificationName:@"ToolTipDidDisappear" object:self];
                     }];
}

#pragma mark Helpers

CGPoint CGPointAtAngleOnCircle(CGFloat radius, float angleInDegrees, CGPoint origin)
{
    // Convert from degrees to radians via multiplication by PI/180
    angleInDegrees -= 90; // remove 90 because the angle has 0 as pointing east
    CGFloat x = (radius * cosf(DEGREES_TO_RADIANS(angleInDegrees))) + origin.x;
    CGFloat y = (radius * sinf(DEGREES_TO_RADIANS(angleInDegrees))) + origin.y;
    
    return CGPointMake(x, y);
}

@end
