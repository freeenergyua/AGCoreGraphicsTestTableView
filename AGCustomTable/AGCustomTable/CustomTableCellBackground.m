//
//  CustomTableCellBackground.m
//  AGCustomTable
//
//  Created by User on 04.01.16.
//  Copyright © 2016 User. All rights reserved.
//

#import "CustomTableCellBackground.h"


@implementation CustomTableCellBackground

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *whiteColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f];
    UIColor *lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    
    CGRect paperRect = self.bounds;
    
    drawLinearGradient(context, paperRect, whiteColor.CGColor, lightGrayColor.CGColor);
    //ободок белый
    
    CGRect strokeRect = CGRectInset(paperRect, 1.0, 1.0);
    CGContextSetStrokeColorWithColor(context, whiteColor.CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokeRect(context,strokeRect);
    

}


@end
