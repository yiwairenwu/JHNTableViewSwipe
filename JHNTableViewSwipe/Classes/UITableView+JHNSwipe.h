//
//  UITableView+JHNSwipe.h
//  YlYth
//
//  Created by 金海南 on 2022/5/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef BOOL (^bool_something_number) (NSInteger number);
typedef void (^do_something_number) (NSInteger number);
@interface UITableView(JHNSwipe)
@property (nonatomic,copy) NSString *deleteTitle;
-(void)addSectionSwipeDelete:(do_something_number)callBack;
-(void)addSectionCanSwipe:(bool_something_number)callBack;
@end

NS_ASSUME_NONNULL_END
