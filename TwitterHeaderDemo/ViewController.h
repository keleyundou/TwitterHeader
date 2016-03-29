//
//  ViewController.h
//  TwitterHeaderDemo
//
//  Created by 冰点 on 16/1/10.
//  Copyright © 2016年 冰点. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;
@property (weak, nonatomic) IBOutlet UIView *header;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;

@property (nonatomic, strong) IBOutlet UIImageView *headerImageView;
@property (nonatomic, strong) IBOutlet UIImageView *headerBlurImageView;
@end

