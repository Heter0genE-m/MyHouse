//
//  HouseInfoCell.m
//  MyHouse
//
//  Created by aurine on 2022/6/20.
//

#import "HouseInfoCell.h"

typedef enum {
    HouseIsPass = 0,
    HouseAuditing,
    HouseNotPass
} HousePassState;

@interface HouseInfoCell ()

@property (nonatomic, strong) UIView *panelView;
@property (nonatomic, strong) UILabel *address_Label;
@property (nonatomic, strong) UILabel *identityIcon_Label;
@property (nonatomic, strong) UILabel *identityName_Label;
@property (nonatomic, strong) UILabel *passState_Label;
@property (nonatomic, strong) UIButton *outHouse_Button;
@property (nonatomic, strong) UIButton *lookMember_Button;
@property (nonatomic, strong) UIButton *remove_Button;

@property (nonatomic, strong) MyHouseInfoModel *model;

@end

@implementation HouseInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addUI];
        [self addConstraints];
        [self addAction];
    }
    return self;
}

#pragma mark ---- setModel

- (void)setModel:(MyHouseInfoModel *)model {
    _model = model;
    NSString *address = [NSString stringWithFormat:@"%@ %@ %@",model.buildingNum,model.unitNum,model.roomNum];
    self.address_Label.text = address;
    
    self.identityIcon_Label.text = model.identity;
    
    self.identityName_Label.text = model.ownerName;
    
    if (model.passState == HouseIsPass) {//已通过
        self.passState_Label.text = @"已通过";
        self.outHouse_Button.hidden = NO;
        self.lookMember_Button.hidden = NO;
        self.passState_Label.backgroundColor = CRCColor(207, 237, 235);
        self.passState_Label.textColor = CRCColor(64, 181, 106);
    }
    else if (model.passState == HouseAuditing) {//审核中
        self.passState_Label.text = @"审核中";
        self.outHouse_Button.hidden = YES;
        self.lookMember_Button.hidden = YES;
        self.passState_Label.backgroundColor = CRCColor(212, 229, 249);
        self.passState_Label.textColor = CRCColor(54, 113, 229);
        [self.outHouse_Button mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
        }];
    }
    else {//未通过
        self.passState_Label.text = @"未通过";
        self.outHouse_Button.hidden = YES;
        self.lookMember_Button.hidden = YES;
        self.remove_Button.hidden = NO;
        self.passState_Label.backgroundColor = CRCColor(246, 200, 198);
        self.passState_Label.textColor = CRCColor(255, 23, 23);
    }
}

#pragma mark ---- addUI

- (void)addUI {
    self.contentView.backgroundColor = CRCColor(232, 232, 232);
    
    self.panelView = ({
        UIView *view = [UIView new];
        view.backgroundColor = WhiteColor;
        view.layer.cornerRadius = 5;
        view.layer.masksToBounds = YES;
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, 2, 160);
        layer.backgroundColor = CRCColor(24, 80, 200).CGColor;
        [view.layer addSublayer:layer];
        view;
    });
    [self.contentView addSubview:self.panelView];
    
    self.address_Label = ({
        UILabel *label = [UILabel new];
        label.textColor = BlackColor;
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        label;
    });
    [self.panelView addSubview:self.address_Label];
    
    self.identityIcon_Label = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = CRCColor(212, 229, 249);
        label.textColor = CRCColor(54, 113, 229);
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14 weight:0.1];
        label.layer.cornerRadius = 5;
        label.layer.masksToBounds = YES;
        label;
    });
    [self.panelView addSubview:self.identityIcon_Label];
    
    self.identityName_Label = ({
        UILabel *label = [UILabel new];
        label.textColor = BlackColor;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14 weight:0.1];
        label;
    });
    [self.panelView addSubview:self.identityName_Label];
    
    self.passState_Label = ({
        UILabel *label = [UILabel new];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14 weight:0.1];
        label.layer.cornerRadius = 9;
        label.layer.masksToBounds = YES;
        label;
    });
    [self.panelView addSubview:self.passState_Label];
    
    self.outHouse_Button = ({
        UIButton *button = [UIButton new];
        [button setTitle:@"迁出" forState:UIControlStateNormal];
        [button setTitleColor:BlackColor forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14 weight:0.1];
        button.layer.borderWidth = 1;
        button.layer.borderColor = UIColor.grayColor.CGColor;
        button.layer.cornerRadius = 4;
        button.layer.masksToBounds = YES;
        button;
    });
    [self.panelView addSubview:self.outHouse_Button];
    
    self.lookMember_Button = ({
        UIButton *button = [UIButton new];
        [button setTitle:@"查看成员" forState:UIControlStateNormal];
        [button setTitleColor:BlackColor forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14 weight:0.1];
        button.layer.borderWidth = 1;
        button.layer.borderColor = UIColor.grayColor.CGColor;
        button.layer.cornerRadius = 4;
        button.layer.masksToBounds = YES;
        button;
    });
    [self.panelView addSubview:self.lookMember_Button];
    
    self.remove_Button = ({
        UIButton *button = [UIButton new];
        [button setTitle:@"移除" forState:UIControlStateNormal];
        [button setTitleColor:BlackColor forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14 weight:0.1];
        button.layer.borderWidth = 1;
        button.layer.borderColor = UIColor.grayColor.CGColor;
        button.layer.cornerRadius = 4;
        button.layer.masksToBounds = YES;
        button.hidden = YES;
        button;
    });
    [self.panelView addSubview:self.remove_Button];
}

#pragma mark ---- addConstraints

- (void)addConstraints {
    [self.panelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(20);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.address_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
    [self.identityIcon_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.address_Label);
        make.top.mas_equalTo(self.address_Label.mas_bottom).mas_offset(12);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(20);
    }];
    
    [self.identityName_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.identityIcon_Label);
        make.left.mas_equalTo(self.identityIcon_Label.mas_right).mas_offset(10);
        make.height.mas_equalTo(20);
    }];
    
    [self.passState_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(self.address_Label);
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    
    [self.lookMember_Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-18);
        make.right.mas_equalTo(-20).priorityLow();
        make.size.mas_equalTo(CGSizeMake(90, 28));
    }];
    
    [self.remove_Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-18);
        make.right.mas_equalTo(-20);
        make.size.mas_equalTo(CGSizeMake(90, 28));
    }];
    
    [self.outHouse_Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.lookMember_Button);
        make.right.mas_equalTo(self.lookMember_Button.mas_left).mas_offset(-10);
        make.size.mas_equalTo(CGSizeMake(90, 28));
    }];
}

#pragma mark ---- addAction

- (void)addAction {
    [self.outHouse_Button addTarget:self action:@selector(outHouseButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.lookMember_Button addTarget:self action:@selector(lookMembersButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.remove_Button addTarget:self action:@selector(removeButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -- Action

- (void)outHouseButtonAction {
    if (_delegate && [_delegate respondsToSelector:@selector(outHouseAction:)]) {
        [_delegate outHouseAction:self.model];
    }
}

- (void)lookMembersButtonAction {
    if (_delegate && [_delegate respondsToSelector:@selector(lookHouseMembersAction:)]) {
        [_delegate lookHouseMembersAction:self.model];
    }
}

- (void)removeButtonAction {
    if (_delegate && [_delegate respondsToSelector:@selector(removeHouseAction:)]) {
        [_delegate removeHouseAction:self.model];
    }
}

@end
