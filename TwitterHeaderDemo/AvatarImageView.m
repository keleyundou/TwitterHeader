//
//  AvatarImageView.m
//  TwitterHeaderDemo
//
//  Created by 冰点 on 16/1/10.
//  Copyright © 2016年 冰点. All rights reserved.
//

#import "AvatarImageView.h"

@implementation AvatarImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib
{
    self.layer.cornerRadius = 10.0;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 3.0;
    self.layer.masksToBounds = YES;
}
@end
