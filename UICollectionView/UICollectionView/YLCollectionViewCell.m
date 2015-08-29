//
//  YLCollectionViewCell.m
//  照片查看器
//
//  Created by 邵银岭 on 15/8/29.
//  Copyright (c) 2015年 邵银岭. All rights reserved.
//

#import "YLCollectionViewCell.h"

@interface YLCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation YLCollectionViewCell

- (void)awakeFromNib{
    self.imageView.layer.borderWidth = 3;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.cornerRadius = 5;
    self.imageView.clipsToBounds = YES;
}

- (void)setImage:(NSString *)image
{
    _image = image;
    self.imageView.image = [UIImage imageNamed:image];
}

@end
