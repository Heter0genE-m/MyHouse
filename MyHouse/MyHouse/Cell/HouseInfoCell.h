//
//  HouseInfoCell.h
//  MyHouse
//
//  Created by aurine on 2022/6/20.
//

#import <UIKit/UIKit.h>

@protocol iHouseInfoCellDelegate <NSObject>

- (void)outHouseAction:(MyHouseInfoModel *)model;
- (void)lookHouseMembersAction:(MyHouseInfoModel *)model;
- (void)removeHouseAction:(MyHouseInfoModel *)model;

@end

@interface HouseInfoCell : UITableViewCell

@property (nonatomic, weak) id<iHouseInfoCellDelegate> delegate;
- (void)setModel:(MyHouseInfoModel *)model;


@end


