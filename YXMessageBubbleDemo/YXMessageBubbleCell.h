//
//  YXMessageBubbleCell.h
//  YXMessageBubbleDemo
//
//  Created by JI Yixuan on 16/6/19.
//  Copyright © 2016年 iamjiyixuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXMessageBubbleCell : UITableViewCell

@property(nullable, nonatomic, strong) UIImageView *avatarImageView;
@property(nullable, nonatomic, strong) UIImageView *bubble;
@property(nullable, nonatomic, strong) UILabel *messageTextLabel;

- (void)bindText:(NSString *)text;

@end
