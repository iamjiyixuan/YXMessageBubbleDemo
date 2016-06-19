//
//  YXMessageBubbleCell.m
//  YXMessageBubbleDemo
//
//  Created by JI Yixuan on 16/6/19.
//  Copyright © 2016年 iamjiyixuan. All rights reserved.
//

#import "YXMessageBubbleCell.h"

// 3rd
#import <Masonry/Masonry.h>

static CGSize kAvatarSize = {35.0f, 35.0f};

@implementation YXMessageBubbleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        self.avatarImageView = ({
           
            UIImageView *view = [[UIImageView alloc] init];
            view.clipsToBounds = YES;
            view.layer.cornerRadius = kAvatarSize.width / 2;
            view.layer.borderWidth = 1.5f;
            view.layer.borderColor = [UIColor whiteColor].CGColor;
        
            [self.contentView addSubview:view];
            
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(kAvatarSize);
                make.top.mas_equalTo(view.superview.mas_top).offset(10.0f);
                make.left.mas_equalTo(view.superview.mas_left).offset(10.0f);
                make.bottom.mas_lessThanOrEqualTo(view.superview.mas_bottom).offset(-10.0f);
            }];
            
            view;
        });
        
        self.bubble = ({
           
            UIImage *bubbleImage = [UIImage imageNamed:@"message_bubble_in_border"];
            bubbleImage = [bubbleImage resizableImageWithCapInsets:UIEdgeInsetsMake(35, 22, 10, 10) resizingMode:UIImageResizingModeStretch];
            
            UIImageView *view = [[UIImageView alloc] init];
            view.image = bubbleImage;
            
            [self.contentView addSubview:view];
            
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.avatarImageView.mas_right).offset(10.0f);
                make.top.mas_equalTo(self.avatarImageView.mas_top);
                make.bottom.mas_equalTo(view.superview.mas_bottom).offset(-10.0f);
                make.width.mas_lessThanOrEqualTo([UIScreen mainScreen].bounds.size.width - kAvatarSize.width - 2 * 10.0f - 40.0f);
            }];
            
            view;
        });
        
        self.messageTextLabel = ({
            
            UILabel *view = [[UILabel alloc] init];
            view.numberOfLines = 0;
            view.textColor = [UIColor darkTextColor];
            
            [self.contentView addSubview:view];
            
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(self.bubble).with.insets(UIEdgeInsetsMake(5.0f, 10.0f, 5.0f, 15.0f));
            }];
            
            view;
        });
    }
    return self;
}

@end
