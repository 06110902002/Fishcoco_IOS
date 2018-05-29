//
//  HomeView.h
//  fiscoco
//
//  Created by administrator on 2018/5/24.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopStatusView.h"

@class EquOrSpaceView;
@interface HomeView : UIView<TitleBarClickListener,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) TopStatusView* titleBarView;
@property(nonatomic,strong) UISegmentedControl* segment;
@property(nonatomic,strong) UICollectionView* sceneListView;
@property(nonatomic,strong) NSMutableArray* sceneDataList;

@property(nonatomic,strong) UICollectionView* equAndSpaceListView;
@property(nonatomic,strong) UICollectionViewFlowLayout* equAndSpaceLayout;
@property(nonatomic,strong) UICollectionViewFlowLayout* equAndSpaceGridLayout;

@property(nonatomic,strong) UIView* equAndSpaceSwitchView;
@property(nonatomic,strong) UIImageView* equSpaceIconView;
@property(nonatomic,strong) UILabel* equSpaceLabel;
@property(nonatomic,strong) UIButton* equSpaceSwitchBtn;
@property(nonatomic,copy) NSString* curSwitchBtnImgName;
@property(nonatomic,strong) EquOrSpaceView* gridCellItemView;

@property(nonatomic,strong) NSMutableArray* equOrSpaceList;


-(void) buildTopNavbarView;


@end
