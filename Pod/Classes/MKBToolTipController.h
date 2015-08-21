//
//  MKBToolTipController.h
//  Sainsburys
//
//  Created by Mark Bridges on 30/07/2015.
//  Copyright (c) 2015 Sainsbury's. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKBToolTipController : NSObject

+ (void)showToolTipForView:(UIView*)view atAngle:(float)angle withText:(NSAttributedString*)text;

+ (void)showToolTipForBarButton:(UIBarButtonItem*)barButton atAngle:(float)angle withText:(NSAttributedString*)text;

+ (void)showToolTipFromPoint:(CGPoint)point withDistance:(CGFloat)distanceFromPoint atAngle:(float)angle withText:(NSAttributedString*)text;

@end
