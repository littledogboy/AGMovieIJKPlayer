//
//  AGMovieView.m
//  AGMovieIJKPlayer
//
//  Created by 吴书敏 on 16/9/19.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "AGMovieView.h"
#import "Masonry.h"

@interface AGMovieView ()

@property (nonatomic, strong) UIView *ijkPlayerView;

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIView *playView;



@end

@implementation AGMovieView

// nib 加载完成后调用
- (void)awakeFromNib {
    [super awakeFromNib];
}

// loadNib 时调用
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self == nil) return nil;
    
    // 利用xib自定义视图时，self 必须添加 contentView
    self.contentView = [[[NSBundle mainBundle] loadNibNamed:@"AGMovieView" owner:self options:nil] lastObject];
    [self addSubview:_contentView];
    return self;
}

// 给contentView设置约束
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    // 注意这里不能 写成 make.edges.mas_equalTo(self)
    // self 这里为 any any 状态下的宽度 600 会出错的，正确写法用 [UIScreen mainScreen]
    CGRect bounds = [UIScreen mainScreen].bounds;
    [_contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@(0));
        make.size.mas_equalTo(bounds.size);
    }];
}

- (void)setMovieURLArray:(NSArray *)movieURLArray {
    if (_movieURLArray != movieURLArray) {
        _movieURLArray = [movieURLArray copy];
        
        // init ijkPlayer
        NSURL *flvURL = _movieURLArray[0];
        self.ijkPlayer = [[IJKFFMoviePlayerController alloc] initWithContentURL:flvURL withOptions:[IJKFFOptions optionsByDefault]];
        _ijkPlayer.scalingMode = IJKMPMovieScalingModeAspectFill;
        _ijkPlayer.shouldAutoplay = YES;
        self.ijkPlayerView = self.ijkPlayer.view;
        _ijkPlayerView.frame = self.playView.bounds;
        [self.playView addSubview:_ijkPlayerView];
        [self.ijkPlayer prepareToPlay];
        
        // 通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ijkPlayBackStateDidChange:) name:IJKMediaPlaybackIsPreparedToPlayDidChangeNotification object:nil];
    }
}

- (void)ijkPlayBackStateDidChange:(NSNotification *)notification {
    NSLog(@"aaa");
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
