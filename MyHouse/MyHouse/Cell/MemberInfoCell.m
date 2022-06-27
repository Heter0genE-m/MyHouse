//
//  MemberInfoCell.m
//  MyHouse
//
//  Created by aurine on 2022/6/23.
//

#import "MemberInfoCell.h"

@interface MemberInfoCell ()

@property (nonatomic, strong) UIView *panelView;
@property (nonatomic, strong) UIImageView *memberIconView;
@property (nonatomic, strong) UILabel *memberName_Label;
@property (nonatomic, strong) UILabel *memberIdentity_Label;

@property (nonatomic, strong)HouseMemberInfoModel *model;

@end

@implementation MemberInfoCell

#pragma mark -- 初始化UI 约束 Action

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addUI];
        [self addConstraints];
        [self addAction];
    }
    return self;
}

- (void)setModel:(HouseMemberInfoModel *)model {
    _model = model;
    self.memberName_Label.text = model.memberName;
    
    self.memberIdentity_Label.text = model.memberIdentity;
}

- (void)addUI {
    self.backgroundColor = CRCColor(232, 232, 232);
    
    self.panelView = ({
        UIView *view = [UIView new];
        view.backgroundColor = WhiteColor;
        view.layer.cornerRadius = 4;
        view.layer.masksToBounds = YES;
        view;
    });
    [self.contentView addSubview:self.panelView];
    
    self.memberIconView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"approval_icon"];
        imageView;
    });
    [self.panelView addSubview:self.memberIconView];
    
    self.memberName_Label = ({
        UILabel *label = [UILabel new];
        label.textColor = BlackColor;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14 weight:0.1];
        label;
    });
    [self.panelView addSubview:self.memberName_Label];
    
    self.memberIdentity_Label = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = CRCColor(212, 229, 249);
        label.textColor = CRCColor(54, 113, 229);
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:13 weight:0.1];
        label.layer.cornerRadius = 5;
        label.layer.masksToBounds = YES;
        label;
    });
    [self.panelView addSubview:self.memberIdentity_Label];
}

- (void)addConstraints {
    [self.panelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(20);
        make.bottom.mas_equalTo(-5);
    }];
    
    [self.memberIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(20);
        make.size.mas_equalTo(CGSizeMake(18, 18));
    }];
    
    [self.memberName_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.memberIconView);
        make.left.mas_equalTo(self.memberIconView.mas_right).mas_offset(18);
        make.height.mas_equalTo(self.memberIconView);
    }];
    
    [self.memberIdentity_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.memberName_Label);
        make.left.mas_equalTo(self.memberName_Label.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(self.memberName_Label);
        make.width.mas_equalTo(40);
    }];
}

- (void)addAction {
    
}
@end
