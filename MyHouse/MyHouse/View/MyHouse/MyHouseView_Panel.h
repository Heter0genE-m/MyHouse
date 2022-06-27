//
//  MyHouseView_Panel.h
//  MyHouse
//
//  Created by aurine on 2022/6/20.
//

#import <UIKit/UIKit.h>

@protocol iMyHousePanelDelegate <NSObject>

- (void)outMyHouseAction:(MyHouseInfoModel *)model;
- (void)lookMyHouseMembersAction:(MyHouseInfoModel *)model;

@end


@interface MyHouseView_Panel : UIView
@property (nonatomic, weak) id<iMyHousePanelDelegate> delegate;

@end


