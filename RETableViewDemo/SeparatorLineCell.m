//
//  SeparatorLineCell.m
//  RETableViewDemo
//
//  Created by iOSDeveloper003 on 17/2/14.
//  Copyright © 2017年 Liang. All rights reserved.
//

#import "SeparatorLineCell.h"
#import "Masonry.h"

@implementation SeparatorLineItem

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    //cell 默认高度 10
    [self setCellHeight:10.0];
    return self;
}


@end
//---------------------O(∩_∩)O---------------------------
@implementation SeparatorLineCell {
    UIView *_bgView;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self setupViews];
    return self;
}

- (void)setupViews {
    UIView *bgView = ({
        UIView *view = [[UIView alloc] init];
        view;
    });
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    _bgView = bgView;
}


#pragma mark - Accessors

- (void)cellWillAppear
{
    [super cellWillAppear];
    SeparatorLineItem *item = (id)self.item;
    _bgView.backgroundColor = item.bgColor;
    
}

@end
