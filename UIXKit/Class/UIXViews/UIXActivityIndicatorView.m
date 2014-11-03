//
//  UIXActivityIndicatorView.m
//  UIXTest
//
//  Created by WangXiaoXiang on 14/10/27.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXActivityIndicatorView.h"
#import "UIXRefreshCircleProgressView.h"
#import "UIView+Animation.h"

@interface UIXActivityIndicatorView()
@property(nonatomic,strong) UIXRefreshCircleProgressView*  circleProgressView;

@property(nonatomic,assign,getter=isAnimating) BOOL animating;
@end

@implementation UIXActivityIndicatorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setup];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
      [self _setup];
    }
    return self;
}

-(void)_setup{
    self.circleProgressView = [[UIXRefreshCircleProgressView alloc] initWithFrame:CGRectInset(self.bounds, 4, 4)];
    self.circleProgressView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    self.circleProgressView.baseNumber = 0.9f;
    self.circleProgressView.animationDuration = 1.0f;
    self.circleProgressView.progressAnimationStop = [self progressAnimationStop];
    [self addSubview:self.circleProgressView];
    [self startAnimating];
}

-(UIXProgressAnimationStop)progressAnimationStop{
    __weak typeof(self) weakSelf = self;
    UIXProgressAnimationStop progressAnimationStop = ^(CGFloat progress){
        if (progress == UIXCircleProgressMaxValue*self.circleProgressView.baseNumber){
            [weakSelf.circleProgressView rotate360WithDuration:1.0f
                                                   repeatCount:MAXFLOAT
                                           mediaTimingFunction:UIMediaTimingFunctionLinear
                                                     clockwise:YES];
        }
    };
    return progressAnimationStop;
}

#pragma mark - animation
-(void)startAnimating{
    [self stopAnimating];
    self.animating = YES;
    self.hidden = NO;
    [self.circleProgressView setProgress:1.0 animated:YES];
}

- (void)stopAnimating{
    if (self.animating) {
        self.circleProgressView.progress = 0.0f;
        [self.circleProgressView removeRotate360Animation];
        if (self.isHidesWhenStopped) {
            self.hidden = YES;
        }
        self.animating = NO;
    }
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"%.2f",self.circleProgressView.progress);
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
