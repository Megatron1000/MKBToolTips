//
//  UIView+MKBAdditions.m
//  Sainsburys
//
//  Created by Mark Bridges on 31/07/2015.
//  Copyright (c) 2015 Sainsbury's. All rights reserved.
//

#import "UIView+MKBAdditions.h"

@implementation UIView (MKBAdditions)

- (UIView*)topMostSuperview
{
    UIView *view = self.superview;
    
    while (view)
    {
        if (view.superview)
        {
            view = view.superview;
        }
        else
        {
            return view;
        }
    }
    
    return nil;
}

@end
