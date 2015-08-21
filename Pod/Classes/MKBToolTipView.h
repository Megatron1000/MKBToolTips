//
//  JSToolTipView2.h
//  Sainsburys
//
//  Created by Mark Bridges on 30/07/2015.
//  Copyright (c) 2015 Sainsbury's. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MKBToolTipView : UIView

@property (weak, nonatomic) IBOutlet UIView *tipCircle;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@property (nonatomic, weak) NSLayoutConstraint *leftLayoutConstraint;
@property (nonatomic, weak) NSLayoutConstraint *topLayoutConstraint;

- (void)rotateCircleToAngle:(float)angle;

@end