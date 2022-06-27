//
//  MyHouseView_Bottom.h
//  MyHouse
//
//  Created by aurine on 2022/6/21.
//

#import <UIKit/UIKit.h>

typedef enum {
    addHouseType = 0,
    addMemberType
} addButtonType;

@interface MyHouseView_Bottom : UIView

@property (nonatomic, copy)void(^addHouseBlock)(void);
@property (nonatomic, copy)void(^addMemberBlock)(void);

- (instancetype)initWithFrame:(CGRect)frame andType:(addButtonType)type;
@end


