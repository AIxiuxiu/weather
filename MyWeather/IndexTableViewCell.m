//
//  IndexTableViewCell.m
//  MyWeather
//
//  Created by mac on 16-2-28.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "IndexTableViewCell.h"

@implementation IndexTableViewCell

- (void)dealloc{
    [_titleLabel release];
    [_zsLabel release];
    [_tiptLabel release];
    [_desLabel release];
    [super dealloc];
}

- (void)awakeFromNib {
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)createSubView{
    [self createTitleLabel];
    [self createZsLabel];
    [self createTiptLabel];
    [self createDesLabel];
}

- (void)heightWithIndexModel:(IndexModel *)indexModel{
    
    CGSize detailSize = [indexModel.des boundingRectWithSize:CGSizeMake(330, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_desLabel.font} context:nil].size;
    _desLabel.frame = CGRectMake(30, 75, detailSize.width, detailSize.height);
    
    _height = CGRectGetMaxY(_desLabel.frame) + 10;
}

- (void)createTitleLabel{
    _titleLabel= [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 100, 30)];
    _titleLabel.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:_titleLabel];
}

- (void)createZsLabel{
    _zsLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 5, 100, 30)];
    _zsLabel.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:_zsLabel];
}

- (void)createTiptLabel{
    _tiptLabel= [[UILabel alloc] initWithFrame:CGRectMake(10, 40, 130, 30)];
    _tiptLabel.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:_tiptLabel];
}

- (void)createDesLabel{
    _desLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 75, 330, 30)];
    _desLabel.font = [UIFont systemFontOfSize:18];
    _desLabel.numberOfLines = 0;
    [self.contentView addSubview:_desLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
