//
//  HomeView.h
//  fiscoco
//
//  Created by administrator on 2018/5/24.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopStatusView.h"

@interface HomeView : UIView<TitleBarClickListener,UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic,strong) TopStatusView* titleBarView;
@property(nonatomic,strong) UISegmentedControl* segment;
@property(nonatomic,strong) UICollectionView* sceneListView;
@property(nonatomic,strong) NSArray* sceneDataList;


-(void) buildTopNavbarView;


@end
