//
//  TWTButton.m
//  TwitterHeaderDemo
//
//  Created by 冰点 on 16/1/10.
//  Copyright © 2016年 冰点. All rights reserved.
//

#import "TWTButton.h"

@implementation TWTButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib
{
    self.layer.cornerRadius = 5.0;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [UIColor colorWithRed:0.4 green:0.8 blue:1 alpha:1].CGColor;
    self.layer.masksToBounds = YES;
}
@end
