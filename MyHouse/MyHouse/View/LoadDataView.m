//
//  LoadDataView.m
//  MyHouse
//
//  Created by aurine on 2022/6/22.
//

#import "LoadDataView.h"

@interface LoadDataView ()

@end

@implementation LoadDataView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addUI];
        [self addConstraints];
        [self addAction];
    }
    return self;
}

- (void)addUI {
    self.backgroundColor = CRCColor(232, 232, 232);
    
    self.load_ImageView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"load_data"];
        imageView;
    });
    [self addSubview:self.load_ImageView];
    
    self.load_Label = ({
        UILabel *label = [UILabel new];
        label.text = @"数据加载中...";
        label.textColor = BlackColor;
        label.textAlignment = NSTextAlignmentCenter;
        label;
    });
    [self addSubview:self.load_Label];
    
}

- (void)addConstraints {
    [self.load_ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
    
    [self.load_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.load_ImageView.mas_bottom).mas_offset(10);
        make.left.right.mas_equalTo(self.load_ImageView);
    }];
}

- (void)addAction {
    
}

@end
