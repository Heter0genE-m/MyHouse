//
//  TopBarView.m
//  MyHouse
//
//  Created by aurine on 2022/6/20.
//

#import "TopBarView.h"

@implementation TopBarView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addUI];
        [self addFrame];
        [self addAction];
    }
    return self;
}

- (void)addUI {
    self.backgroundColor = WhiteColor;
    
    self.titleLabel = ({
        UILabel *label = [UILabel new];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:18];
        label.textColor = UIColor.blackColor;
        label;
    });
    [self addSubview:self.titleLabel];
    
    self.back_Button = ({
        UIButton *button = [UIButton new];
        button;
    });
    [self addSubview:self.back_Button];
    
    self.back_Label = ({
        UILabel *label = [UILabel new];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = BlackColor;
        label;
    });
    [self addSubview:self.back_Label];
    
    self.right_Button = ({
        UIButton *button = [UIButton new];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        button;
    });
    [self addSubview:self.right_Button];
}

- (void)addFrame {
    CGFloat height = TopStatuHeight > 20? 52 : 28;
    _titleLabel.frame = CGRectMake(130, height, ScreenWidth - 260, 32);
    
    _back_Button.frame = CGRectMake(0, height, 60, 32);
    
    _back_Label.frame = CGRectMake(30, height, 50, 32);
    
    _right_Button.frame = CGRectMake(self.bounds.size.width - 80, height, 60, 32);
}

- (void)addAction {
    [self.back_Button addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.right_Button addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark ---- Action

- (void)backBtnAction {
    if (_backBtnDelegate && [_backBtnDelegate respondsToSelector:@selector(backBtnActionDelegate)]) {
        [_backBtnDelegate backBtnActionDelegate];
    }
}

- (void)rightBtnAction {
    if (_rightBtnDelegate && [_rightBtnDelegate respondsToSelector:@selector(rightBtnActionDelegate)]) {
        [_rightBtnDelegate rightBtnActionDelegate];
    }
}


#pragma mark ---- setProperties

//设置导航条是否隐藏
- (void)setTopBarHidden:(BOOL)isHide {
    self.hidden = isHide;
}
//设置标题
- (void)setTitle:(NSString *)title {
    _titleLabel.text = title;
}
//设置返回按钮图片
- (void)setBackButtonImg:(UIImage *)image {
    [_back_Button setImage:image forState:UIControlStateNormal];
}
//设置返回按钮文本
- (void)setbackButtonText:(NSString *)text {
    _back_Label.text = text;
}
//设置返回按钮文本字号，颜色
- (void)setBackButtonTextFont:(UIFont *)font andColor:(UIColor *)color {
    _back_Label.font = font;
    _back_Label.textColor = color;
}
//设置返回按钮隐藏
- (void)setBackButtonHidden:(BOOL)isHide {
    _back_Button.hidden = isHide;
}
//设置右边按钮图片
- (void)setRightButtonImg:(UIImage *)image {
    [_right_Button setImage:image forState:UIControlStateNormal];
}
//设置右边按钮文本
- (void)setRightButtonText:(NSString *)text {
    [_right_Button setTitle:text forState:UIControlStateNormal];
}
//设置右边按钮文本字号，字体颜色
- (void)setRightButtonTextFont:(UIFont *)font andTextColor:(UIColor *)color {
    _right_Button.titleLabel.font = font;
    [_right_Button setTitleColor:color forState:UIControlStateNormal];
}
//设置右边按钮隐藏
- (void)setRightButtonHidden:(BOOL)isHide {
    _right_Button.hidden = isHide;
}

@end
