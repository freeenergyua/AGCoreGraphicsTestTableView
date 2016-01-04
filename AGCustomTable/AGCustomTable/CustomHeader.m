//
//  CustomHeader.m
//  AGCustomTable
//
//  Created by User on 04.01.16.
//  Copyright © 2016 User. All rights reserved.
//

#import "CustomHeader.h"
#import "Common.h"



@interface CustomHeader()

@property (nonatomic, assign) CGRect coloredBoxRect;
@property (nonatomic, assign) CGRect paperRect;

@end

@implementation CustomHeader

- (id)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.opaque = NO;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20.0];
        _titleLabel.textColor = [UIColor greenColor];
//        _titleLabel.shadowColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f];
        _titleLabel.shadowOffset = CGSizeMake(0, -1);
        [self addSubview:_titleLabel];
        _lightColor = [UIColor colorWithRed:105.0f/255.0f green:179.0f/255.0f blue:216.0f/255.0f alpha:1.0];
        _darkColor = [UIColor colorWithRed:21.0/255.0 green:92.0/255.0 blue:136.0/255.0 alpha:1.0];
    }
    return self;
}


-(void) layoutSubviews
{
    CGFloat coloredBoxMargin = 6.0;
    CGFloat coloredBoxHeight = 40.0;
    self.coloredBoxRect = CGRectMake(coloredBoxMargin, coloredBoxMargin, self.bounds.size.width-coloredBoxMargin*2, coloredBoxHeight);
    //(6,6,width - 2*6,40)
    
    CGFloat paperMargin = coloredBoxMargin + 3.0f;
    //тень
    self.paperRect = CGRectMake(paperMargin, CGRectGetMaxY(self.coloredBoxRect), self.bounds.size.width-paperMargin*2, self.bounds.size.height-CGRectGetMaxY(self.coloredBoxRect));
    
    self.titleLabel.frame = self.coloredBoxRect;
}

// Replace drawRect with the following
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *shadowColor = [UIColor colorWithRed:0.2f green:0.2f blue:0.2f alpha:0.5f];
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 3), 3.0, shadowColor.CGColor);
    CGContextSetFillColorWithColor(context, self.darkColor.CGColor);
    CGContextFillRect(context, self.coloredBoxRect);
    CGContextRestoreGState(context);
    
    drawGlossAndGradient(context, self.coloredBoxRect, self.lightColor.CGColor, self.darkColor.CGColor);
    
    CGContextSetStrokeColorWithColor(context, self.darkColor.CGColor);
    CGContextSetLineWidth(context, 1.0);

    
    
}


@end
