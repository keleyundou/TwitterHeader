//
//  ViewController.m
//  TwitterHeaderDemo
//
//  Created by 冰点 on 16/1/10.
//  Copyright © 2016年 冰点. All rights reserved.
//

#import "ViewController.h"
#import "FXBlurView.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    CGFloat offset_HeaderStop, offset_B_LabelHeader, distance_W_LabelHeader;
}
@end

@implementation ViewController
@synthesize headerImageView, header, headerLabel, headerBlurImageView, avatarImage;


- (void)viewDidLoad {
    [super viewDidLoad];
    offset_HeaderStop = 40.0;
    offset_B_LabelHeader = 95.0;
    distance_W_LabelHeader = 35.0;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // Header - Image
    headerImageView = [[UIImageView alloc] initWithFrame:header.bounds];
    headerImageView.image = [UIImage imageNamed:@"header_bg"];
    headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    [header insertSubview:headerImageView belowSubview:headerLabel];
    
    // Header - Blurred Image
    headerBlurImageView = [[UIImageView alloc] initWithFrame:header.bounds];
    headerBlurImageView.image = [[UIImage imageNamed:@"header_bg"] blurredImageWithRadius:10 iterations:20 tintColor:[UIColor clearColor]];
    headerBlurImageView.contentMode = UIViewContentModeScaleAspectFill;
    headerBlurImageView.alpha = 0.0;
    [header insertSubview:headerBlurImageView belowSubview:headerLabel];
    header.clipsToBounds = YES;
}
//MARK: UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.y;
    CATransform3D avatarTransform = CATransform3DIdentity;
    CATransform3D headerTransform = CATransform3DIdentity;
    NSLog(@"offset = %.2f headerImage-R:%@",offset,NSStringFromCGRect(header.frame));
    // PULL DOWN -----------------
    if (offset < 0) {
        CGFloat headerScaleFactor = -(offset) / header.bounds.size.height;
        CGFloat headerSizevariation = (header.bounds.size.height * (1.0 + headerScaleFactor) - header.bounds.size.height) / 2.0;
        headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0);
        headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0);
        header.layer.transform = headerTransform;
        
    }
    
    // SCROLL UP/DOWN ------------
    else {
        // Header -----------
        
        headerTransform = CATransform3DTranslate(headerTransform, 0, MAX(-offset_HeaderStop, -offset), 0);
        //  ------------ Label
        CATransform3D labelTransform = CATransform3DMakeTranslation(0, MAX(-distance_W_LabelHeader, offset_B_LabelHeader - offset), 0);
        headerLabel.layer.transform = labelTransform;
        
        //  ------------ Blur
        headerBlurImageView.alpha = MIN(1.0, (offset - offset_B_LabelHeader) / distance_W_LabelHeader);
        
        // Avatar -----------
        CGFloat avatarScaleFactor = MIN(offset_HeaderStop, offset) / avatarImage.bounds.size.height / 1.4;
        CGFloat avatarSizevariation = (avatarImage.bounds.size.height * (1.0 + avatarScaleFactor) - avatarImage.bounds.size.height) / 2.0;
        avatarTransform = CATransform3DTranslate(avatarTransform, 0, avatarSizevariation, 0);
        avatarTransform = CATransform3DScale(avatarTransform, 1.0-avatarScaleFactor, 1.0-avatarScaleFactor, 0);
        
        if (offset <= offset_HeaderStop) {
            if (avatarImage.layer.zPosition < header.layer.zPosition) {
                header.layer.zPosition = 0;
            }
        } else {
            if (avatarImage.layer.zPosition >= header.layer.zPosition) {
                header.layer.zPosition = 2;
            }
        }
    }
    
    // Apply Transformations
    header.layer.transform = headerTransform;
    avatarImage.layer.transform = avatarTransform;
}
@end
