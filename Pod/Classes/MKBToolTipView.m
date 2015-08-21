//
//  JSToolTipView2.m
//  Sainsburys
//
//  Created by Mark Bridges on 30/07/2015.
//  Copyright (c) 2015 Sainsbury's. All rights reserved.
//

#import "MKBToolTipView.h"

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface MKBToolTipView ()

@end

@implementation MKBToolTipView

- (void)rotateCircleToAngle:(float)angle;
{
    double rads = DEGREES_TO_RADIANS(angle - 180); // - 180 because our view has the point on the top when it should be at the bottom
    CGAffineTransform transform = CGAffineTransformRotate(self.tipCircle.transform, rads);
    self.tipCircle.transform = transform;
}

@end
