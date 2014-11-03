//
//  UIXActivityIndicatorView.m
//  UIXRefreshControl
//
//  Created by WangXiaoXiang on 14/10/22.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXCircleProgressView.h"

NSString * const UIXProgressViewProgressAnimationKey = @"UIXProgressViewProgressAnimationKey";

@interface UIXCircularProgressView : UIView
/*更新进度*/
- (void)updateProgress:(float)progress;
/*获取图层*/
- (CAShapeLayer *)shapeLayer;
@end


@interface UIXCircleProgressView()

@property(nonatomic,weak) UIXCircularProgressView* progressView;

@end


@implementation UIXCircleProgressView

#pragma mark - init
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
    UIXCircularProgressView* progressView = [[UIXCircularProgressView alloc] initWithFrame:self.bounds];
    progressView.shapeLayer.fillColor = [UIColor whiteColor].CGColor;
    [self addSubview:progressView];
    self.progressView = progressView;
    
    [self resetDefaults];
}
- (void)resetDefaults {
    self.animationDuration = 0.3f;
    self.progress = 0;
//    _baseNumber = 1.0f;
    [self.progressView updateProgress:self.progress];
    self.borderWidth = 0.0f;
    self.lineWidth = 2.0f;
    self.lineColor = [UIColor redColor];
    self.borderColor = [UIColor redColor];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    self.progressView.shapeLayer.borderWidth = borderWidth;
}


#pragma mark - Color

-(void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    self.progressView.shapeLayer.borderColor = borderColor.CGColor;
}

-(void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    self.progressView.shapeLayer.strokeColor = lineColor.CGColor;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.progressView.frame = self.bounds;
//    self.centralView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}

#pragma progess

-(void)setProgress:(CGFloat)progress{
    [self setProgress:progress animated:NO];
}

-(void)setAnimationDuration:(CFTimeInterval)animationDuration{
    if (animationDuration < 0) {
        return;
    }
//    _animationDuration = animationDuration;
    [super setAnimationDuration:animationDuration];
}

-(void)setProgress:(float)progress animated:(BOOL)animated{
//    progress = progress*self.baseNumber;
    progress = MAX(MIN(progress, UIXCircleProgressMaxValue), UIXCircleProgressMinValue);
    
    if (self.progress == progress) {
        return;
    }
    
    if (animated) {
        [self animateToProgress:progress];
    }else{
        [self stopAnimation];
//        self.progress = progress;
        super.progress = progress;
        [self.progressView updateProgress:self.progress];
    }
//    NSLog(@"_progress:%0.2f",_progress);
}

-(void)animateToProgress:(CGFloat)progress{
    [self stopAnimation];
    // Add shape animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = self.animationDuration;
    animation.fromValue = @(self.progress);
    animation.toValue = @(progress);
    animation.delegate = self;
    [self.progressView.layer addAnimation:animation forKey:UIXProgressViewProgressAnimationKey];
    //TODO:数字进度 以后版本中添加
    
    
    super.progress = progress;
    
}
-(void)stopAnimation{
    [self.progressView.layer removeAnimationForKey:UIXProgressViewProgressAnimationKey];
    //TODO:停止数字记数
}

#pragma mark - CAAnimationDelegate
-(void)animationDidStart:(CAAnimation *)anim{
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
//    NSLog(@"animationDidStop");
    [self.progressView updateProgress:self.progress];
    if (self.progressAnimationStop != NULL) {
        self.progressAnimationStop(self.progress);
    }
}

@end




@implementation UIXCircularProgressView

+(Class)layerClass{
    return CAShapeLayer.class;
}

-(CAShapeLayer *)shapeLayer{
    return (CAShapeLayer*)self.layer;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.shapeLayer.cornerRadius = self.frame.size.width / 2.0f;
    self.shapeLayer.path = [self layoutPath].CGPath;
}

-(UIBezierPath*)layoutPath{
    const double TWO_M_PI = 2.0 * M_PI;
    const double startAngle = 0.75 * TWO_M_PI;
    const double endAngle = startAngle + TWO_M_PI;
    
    CGFloat width = self.frame.size.width;
    CGFloat borderWidth = self.shapeLayer.borderWidth;
    return [UIBezierPath bezierPathWithArcCenter:CGPointMake(width/2.0f, width/2.0f)
                                          radius:width/2.0f - borderWidth - 1.0f
                                      startAngle:startAngle
                                        endAngle:endAngle
                                       clockwise:YES];
}

- (void)updateProgress:(float)progress {
    [self updatePath:progress];
}

- (void)updatePath:(float)progress {
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    self.shapeLayer.strokeEnd = progress;
    [CATransaction commit];
}

@end
