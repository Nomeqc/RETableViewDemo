//
//  GrowingTextCell.m
//  RETableViewDemo
//
//  Created by iOSDeveloper003 on 17/2/14.
//  Copyright © 2017年 Liang. All rights reserved.
//

#import "GrowingTextCell.h"
#import "Masonry.h"

@implementation GrowingTextItem



@end
//---------------------O(∩_∩)O---------------------------

@implementation GrowingTextCell {
    UILabel *_contentLabel;
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
    UILabel *label = ({
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.textColor = [UIColor darkTextColor];
        label.font = [UIFont systemFontOfSize:14];
        label;
    });
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.top.offset(16);
        make.right.offset(-16);
        make.bottom.offset(-16).priorityLow();
    }];
    _contentLabel = label;
}


#pragma mark - Accessors

- (void)cellWillAppear
{
    [super cellWillAppear];
    GrowingTextItem *item = (id)self.item;
    _contentLabel.text = item.labelContent;
}

@end
