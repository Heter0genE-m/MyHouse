//
//  TopBarView.h
//  MyHouse
//
//  Created by aurine on 2022/6/20.
//

#import <UIKit/UIKit.h>
#import "SizeHeader.h"

//返回按钮代理
@protocol iBackButtonDelegate <NSObject>

@optional
- (void)backBtnActionDelegate;

@end


//导航栏右按钮代理
@protocol iRightButtonDelegate <NSObject>

@optional
- (void)rightBtnActionDelegate;

@end


@interface TopBarView : UIView
@property (nonatomic, strong) UIButton *back_Button;
@property (nonatomic, strong) UILabel *back_Label;
@property (nonatomic, strong) UIButton *right_Button;

@property (nonatomic, strong) UILabel *titleLabel;
//代理
@property (nonatomic, weak) id<iBackButtonDelegate> backBtnDelegate;
@property (nonatomic, weak) id<iRightButtonDelegate> rightBtnDelegate;

//设置导航条隐藏
- (void)setTopBarHidden:(BOOL)isHide;
//设置标题
- (void)setTitle:(NSString *)title;

//设置返回按钮隐藏
- (void)setBackButtonHidden:(BOOL)isHide;
//设置返回按钮图片
- (void)setBackButtonImg:(UIImage *)image;
//设置返回文本
- (void)setbackButtonText:(NSString *)text;
/**设置返回按钮文本字号，颜色 默认Font 15 黑色*/
- (void)setBackButtonTextFont:(UIFont *)font andColor:(UIColor *)color;

//设置右边按钮图片
- (void)setRightButtonImg:(UIImage *)image;
//设置右边按钮文本
- (void)setRightButtonText:(NSString *)text;
/**设置右边按钮文本字号，颜色 默认Font 15 黑色*/
- (void)setRightButtonTextFont:(UIFont *)font andTextColor:(UIColor *)color;
//设置右边按钮隐藏
- (void)setRightButtonHidden:(BOOL)isHide;

@end

