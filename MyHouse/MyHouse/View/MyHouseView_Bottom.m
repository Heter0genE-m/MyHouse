//
//  MyHouseView_Bottom.m
//  MyHouse
//
//  Created by aurine on 2022/6/21.
//

#import "MyHouseView_Bottom.h"

@interface MyHouseView_Bottom ()

@property (nonatomic, strong) UIButton *addHouseButton;
@property (nonatomic, assign) addButtonType buttonType;

@end

@implementation MyHouseView_Bottom

- (instancetype)initWithFrame:(CGRect)frame andType:(addButtonType)type {
    if (self = [super initWithFrame:frame]) {
        self.buttonType = type;
        [self addUI];
        [self addConstraints];
        [self addAction];
    }
    return self;
}

- (void)addUI {
    self.addHouseButton = ({
        UIButton *button = [UIButton new];
        button.backgroundColor = CRCColor(89, 127, 243);
        button.layer.cornerRadius = 5;
        button.layer.masksToBounds = YES;
        NSString *buttonTitle = self.buttonType == 0 ? @"添加房屋" : @"添加房屋成员";
        [button setTitle:buttonTitle forState:UIControlStateNormal];
        [button setTitleColor:WhiteColor forState:UIControlStateNormal];
        button;
    });
    [self addSubview:self.addHouseButton];
}

- (void)addConstraints {
    [self.addHouseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(15);
        make.bottom.mas_equalTo(-20);
    }];
}

- (void)addAction {
    [self.addHouseButton addTarget:self action:@selector(addHouseAction) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark ---- Action

- (void)addHouseAction {
    if (self.buttonType == addHouseType) {
        !self.addHouseBlock ? : self.addHouseBlock();
    }
    else {
        !self.addMemberBlock ? : self.addMemberBlock();
    }
    
}
@end
