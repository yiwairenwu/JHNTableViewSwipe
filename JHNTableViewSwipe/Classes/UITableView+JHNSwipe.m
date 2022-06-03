//
//  UITableView+JHNSwipe.m
//  YlYth
//
//  Created by 金海南 on 2022/5/28.
//

#import "UITableView+JHNSwipe.h"
#import <objc/runtime.h>
@interface UITableView()
@property (nonatomic,strong) NSNumber *index;
@property (nonatomic,strong) NSNumber *isOpen;
@property (nonatomic,copy) do_something_number callBack;
@property (nonatomic,copy) bool_something_number boolBack;
@property (nonatomic,strong) UISwipeGestureRecognizer *swipe;
@property (nonatomic,strong) UIView *swipeBg;
@property (nonatomic,strong) UIView *swipeCellBg;
@property (nonatomic,strong) UIView *swipeRedBg;
@property (nonatomic,strong) UIImageView *swipeImageView;
@end
@implementation UITableView(JHNSwipe)

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (UIView *)swipeCellBg{
    return objc_getAssociatedObject(self,  @selector(swipeCellBg));
}
- (void)setSwipeCellBg:(UIView *)swipeCellBg{
    objc_setAssociatedObject(self,  @selector(swipeCellBg),swipeCellBg, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSNumber *)isOpen{
    return objc_getAssociatedObject(self,  @selector(isOpen));
}
- (void)setIsOpen:(NSNumber *)isOpen{
    objc_setAssociatedObject(self,  @selector(isOpen),isOpen, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSString *)deleteTitle{
    return objc_getAssociatedObject(self,  @selector(deleteTitle));
}
- (void)setDeleteTitle:(NSString *)deleteTitle{
    objc_setAssociatedObject(self,  @selector(deleteTitle),deleteTitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)swipeBg{
    return objc_getAssociatedObject(self,  @selector(swipeBg));
}
- (void)setSwipeBg:(UIView *)swipeBg{
    objc_setAssociatedObject(self,  @selector(swipeBg),swipeBg, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)swipeRedBg{
    return objc_getAssociatedObject(self,  @selector(swipeRedBg));
}
- (void)setSwipeRedBg:(UIView *)swipeRedBg{
    objc_setAssociatedObject(self,  @selector(swipeRedBg),swipeRedBg, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIImageView *)swipeImageView{
    return objc_getAssociatedObject(self,  @selector(swipeImageView));
}
- (void)setSwipeImageView:(UIImageView *)swipeImageView{
    objc_setAssociatedObject(self,  @selector(swipeImageView),swipeImageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UISwipeGestureRecognizer *)swipe{
    return objc_getAssociatedObject(self,  @selector(swipe));
}
- (void)setSwipe:(UISwipeGestureRecognizer *)swipe{
    objc_setAssociatedObject(self,  @selector(swipe),swipe, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSNumber *)index{
    return objc_getAssociatedObject(self,  @selector(index));
}
- (void)setIndex:(NSNumber*)index{
    objc_setAssociatedObject(self,  @selector(index),index, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (bool_something_number)boolBack{
    return objc_getAssociatedObject(self,  @selector(boolBack));
}
- (void)setBoolBack:(bool_something_number)boolBack{
    objc_setAssociatedObject(self,  @selector(boolBack),boolBack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (do_something_number)callBack
{
    return objc_getAssociatedObject(self,  @selector(callBack));
}
- (void)setCallBack:(do_something_number)callBack {
    objc_setAssociatedObject(self,  @selector(callBack),callBack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)addSectionSwipeDelete:(do_something_number)callBack{
    [self addNotification];
    [self setCallBack:callBack];
    [self setShowsVerticalScrollIndicator:NO];
    UISwipeGestureRecognizer * recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self addGestureRecognizer:recognizer];
    [self setSwipe:recognizer];
}
- (void)addSectionCanSwipe:(bool_something_number)callBack{
    [self setBoolBack:callBack];
}
- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    
    
    if(recognizer.direction == UISwipeGestureRecognizerDirectionLeft&&!self.isOpen.boolValue) {
        CGPoint point = [recognizer locationInView:self];
        if ([self.layer containsPoint:point]) {
            
            NSIndexPath *indexPath =[self indexPathForRowAtPoint:point];
            if (self.boolBack) {
                BOOL flag = self.boolBack(indexPath.section);
                if (!flag) {
                    return;
                }
            }
            self.isOpen = [NSNumber numberWithInt:1];
            CGRect rect = [self rectForSection:indexPath.section];
            CGRect headRect = [self rectForHeaderInSection:indexPath.section];
            CGRect footRect = [self rectForFooterInSection:indexPath.section];
            CGRect supperRect = [self convertRect:rect toView:self.superview];
           
            UIImage *image = [self screenShotForIndexPaths:indexPath];
            UIView *view = [[UIView alloc] init];
            [view setBackgroundColor:self.backgroundColor];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            [view setFrame:CGRectMake(0,rect.origin.y+headRect.size.height, rect.size.width, image.size.height)];
            [view setClipsToBounds:YES];
            
            
            
            UIView *bg = [[UIView alloc] initWithFrame:self.bounds];
            [bg setBackgroundColor:UIColor.clearColor];
            
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setUserInteractionEnabled:NO];
            [button setTitle:self.deleteTitle?self.deleteTitle:@"删除" forState:UIControlStateNormal];
            [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
            [button .titleLabel setTextColor:UIColor.whiteColor];
            [button setFrame:CGRectMake(rect.size.width-70, supperRect.origin.y<0?(supperRect.origin.y+(supperRect.size.height-headRect.size.height-footRect.size.height)/2-44/2):((supperRect.size.height-headRect.size.height-footRect.size.height)/2-44/2), 70, 44)];
            UIView *btnBg = [[UIView alloc] initWithFrame:CGRectMake(rect.size.width-70, 0, 70, image.size.height)];
            [btnBg setBackgroundColor:UIColor.redColor];
            
            
            [self addSubview:bg];
            CGRect bgRect = [self convertRect:view.frame toView:bg];
            [view setFrame:bgRect];
            [imageView setFrame:bgRect];
            [bg addSubview:view];
            [bg addSubview:imageView];
            [view addSubview:btnBg];
            [view addSubview:button];
            
            
            
            self.index = [NSNumber numberWithInteger:indexPath.section];
            self.swipeBg = bg;
            self.swipeCellBg = view;
            self.swipeRedBg = btnBg;
            self.swipeImageView = imageView;
            
            
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.75 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                [imageView setFrame:CGRectMake(-70, self.swipeImageView.frame.origin.y, self.swipeImageView.frame.size.width, self.swipeImageView.frame.size.height)];
            } completion:^(BOOL finished) {
                
            }];
            UITapGestureRecognizer *deltap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(delAction)];
            [self.swipeRedBg addGestureRecognizer:deltap];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeAction)];
            [self.swipeBg addGestureRecognizer:tap];
            UISwipeGestureRecognizer * recognizer;
            recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(closeAction)];
            [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
            [self.swipeBg addGestureRecognizer:recognizer];
            recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(closeAction)];
            [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
            [self.swipeBg addGestureRecognizer:recognizer];
            
        }
        
        
        
        
    }
    
}
-(void)closeAction{
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.75 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self.swipeRedBg setAlpha:0];
        [self.swipeImageView setFrame:CGRectMake(0, self.swipeImageView.frame.origin.y, self.swipeImageView.frame.size.width, self.swipeImageView.frame.size.height)];
    } completion:^(BOOL finished) {
        self.isOpen = [NSNumber numberWithInt:0];
        [self.swipeBg removeFromSuperview];
        
    }];
}
-(void)delAction{
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.75 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self.swipeRedBg setAlpha:0];
        
        [self.swipeImageView setFrame:CGRectMake(0, self.swipeImageView.frame.origin.y, self.swipeImageView.frame.size.width, self.swipeImageView.frame.size.height)];
    } completion:^(BOOL finished) {
        self.isOpen = [NSNumber numberWithInt:0];
        [self.swipeBg removeFromSuperview];
        if (self.callBack) {
            self.callBack(self.index.integerValue);
        }
    }];
    
}

- (UIImage*)screenShotForIndexPaths:(NSIndexPath*)indexPath{
    long number = [self numberOfRowsInSection:indexPath.section];
  
    CGRect rect = [self rectForSection:indexPath.section];
    CGRect headRect = [self rectForHeaderInSection:indexPath.section];
    CGRect footRect = [self rectForFooterInSection:indexPath.section];
   //增加0.00精度设置避免图片因精度转换变大
    UIGraphicsBeginImageContextWithOptions((CGSizeMake(rect.size.width, floor((rect.size.height-headRect.size.height-footRect.size.height) * 100) / 100 )), NO, 0.0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //---一個一個把cell render到CGContext上
    for (int i=0 ; i<number; i++) {
        UITableViewCell *cell = [self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:indexPath.section]];
        [cell.layer renderInContext:ctx];
        CGRect rect = [self rectForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:indexPath.section]];
        CGContextTranslateCTM(ctx, 0, rect.size.height);
    }
    
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    return image;
}
-(void)addNotification{
    
    [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
}

-(void)dealloc{
    if (self.callBack) {
        [self removeObserver:self forKeyPath:@"contentOffset"];
    }
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if(object == self){
        if ([keyPath isEqualToString:@"contentOffset"]) {
            if (self.isOpen.boolValue) {
                self.isOpen = [NSNumber numberWithBool:NO];
                [self closeAction];
            }
            
        }
    }
    
}

@end
