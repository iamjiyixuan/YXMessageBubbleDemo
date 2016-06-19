//
//  ViewController.m
//  YXMessageBubbleDemo
//
//  Created by JI Yixuan on 16/6/19.
//  Copyright © 2016年 iamjiyixuan. All rights reserved.
//

#import "ViewController.h"

#import "YXMessageBubbleCell.h"

// 3rd
#import <Masonry/Masonry.h>
#import <UITableView+FDTemplateLayoutCell/UITableView+FDTemplateLayoutCell.h>

static NSString *const kMessageItemKey_ID = @"io.iamjiyixuan.YXMessageBubbleDemo.ID";
static NSString *const kMessageItemKey_Avatar = @"io.iamjiyixuan.YXMessageBubbleDemo.Avatar";
static NSString *const kMessageItemKey_Text = @"io.iamjiyixuan.YXMessageBubbleDemo.Text";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nullable, nonatomic, strong) UITableView *tableView;

@property(nullable, nonatomic, strong) NSMutableArray<NSDictionary *> *messageList;

@end

@implementation ViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.85f green:0.33f blue:0.33f alpha:1.0f];
    
    UIImage *avatarImage = [UIImage imageNamed:@"avatar"];

    self.messageList = ({

        NSMutableArray *array = @[].mutableCopy;

        {
            NSDictionary *message = @{ kMessageItemKey_Avatar : avatarImage,
                                       kMessageItemKey_Text : @"Hello" };
            [array addObject:message];
        }
        
        {
            NSDictionary *message = @{ kMessageItemKey_Avatar : avatarImage,
                                       kMessageItemKey_Text : @"There is a protocol called CAMediaTiming which is implemented by CAAnimation, the base class of CABasicAnimation and CAKeyframeAnimation. It is where all the timing related properties – like duration, beginTime and repeatCount – come from. All in all the protocol defines eight properties that can be combines in a number of ways to precisely control timing. The documentation is only a few sentences per property so you could probably read it all and the actual header way faster than this article but I feel that timing is better explained with visualizations." };
            [array addObject:message];
        }
        
        {
            NSDictionary *message = @{ kMessageItemKey_Avatar : avatarImage,
                                       kMessageItemKey_Text : @"To show the different timing related properties, both on their own and in combination, I’m animating a color from orange to blue." };
            [array addObject:message];
        }

        array;
    });

    self.tableView = ({

        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        view.backgroundColor = [UIColor clearColor];
        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        view.dataSource = self;
        view.delegate = self;
        [view registerClass:[YXMessageBubbleCell class] forCellReuseIdentifier:NSStringFromClass([YXMessageBubbleCell class])];
        
        [self.view addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(view.superview);
        }];

        view;
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *messgae = nil;
    if (indexPath.row < self.messageList.count) {
        messgae = [self.messageList objectAtIndex:indexPath.row];
    }
    
    UIImage *avatar = [messgae valueForKey:kMessageItemKey_Avatar];
    NSString *text = [messgae valueForKey:kMessageItemKey_Text];
    
    NSString *identifier = NSStringFromClass([YXMessageBubbleCell class]);
    YXMessageBubbleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.avatarImageView.image = avatar;
    cell.messageTextLabel.text = text;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return 250.0f;
    NSString *identifier = NSStringFromClass([YXMessageBubbleCell class]);
    return [tableView fd_heightForCellWithIdentifier:identifier configuration:^(YXMessageBubbleCell *cell) {
        
        NSDictionary *messgae = nil;
        if (indexPath.row < self.messageList.count) {
            messgae = [self.messageList objectAtIndex:indexPath.row];
        }
        
        UIImage *avatar = [messgae valueForKey:kMessageItemKey_Avatar];
        NSString *text = [messgae valueForKey:kMessageItemKey_Text];
        
        cell.avatarImageView.image = avatar;
        cell.messageTextLabel.text = text;
    }];
}

@end
