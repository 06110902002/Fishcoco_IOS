//
//  DevicesTabView.m
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/5.
//  Copyright © 2018 administrator. All rights reserved.
//

#import "DevicesTabView.h"
#import "DevicesTabCell.h"
#import "DevicesEntity.h"

@implementation DevicesTabView


-(instancetype) initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
    }
    return self;
    
}

//@override method
-(void) initAttr{
    
    [super initAttr];
    
    NSArray* words = [NSArray arrayWithObjects:@"能同时开发android/ios",@"我可以把简历发您看看么?",
                      @"我能去贵司面试么?",@"对不起,贵司提供的职位可能不太适合,谢谢",nil];
    
    for(int i = 0;i < 4; i ++){
        
        DevicesEntity* model = [[DevicesEntity alloc] init];
        model.name = words[i];
        [self.dataList addObject:model];
    }
    
    
    __weak __typeof(&*self)weakSelf = self;
    
    self.scrollHeadView = [[ScrollViewHeadView alloc] initWithFrame:self.frame];
    
    [self.scrollHeadView addTargetWith:self];
    [self.scrollHeadView refresh:^{
        
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC);
        dispatch_after(time, dispatch_get_main_queue(), ^{
            
            [weakSelf.dataList removeAllObjects];
            for(int i = 0;i < 1; i ++){
                
                DevicesEntity* model = [[DevicesEntity alloc] init];
                model.name = [NSString stringWithFormat:@"refresh data:%d",i];
                [weakSelf.dataList addObject:model];
            }
            
            [weakSelf reloadData];
            [weakSelf.scrollHeadView refreshComplete];
        });
        
        
        
    }];
    
    
    //添加上拉加载更多视图
    //    self.scrollFootView = [[ScrollViewRefreshView alloc] initWithFrame:self.frame];
    //    [self.scrollFootView addTargetWith:self];
    //    [self.scrollFootView loadMore:^{
    //
    //        if(weakSelf.dataList.count > 10){
    //
    //            weakSelf.scrollFootView.loadMoreState = LoadMoreNoMoreData;
    //            return ;
    //        }
    //
    //        double delayTime = 3.0;
    //        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, delayTime * NSEC_PER_SEC);
    //        dispatch_after(time, dispatch_get_main_queue(), ^{
    //
    //            for(int i = 0;i < 3; i ++){
    //
    //                QuickWordsModel* model = [[QuickWordsModel alloc] init];
    //                model.sWords = [NSString stringWithFormat:@"loadmore data:%d",i];
    //                [weakSelf.dataList addObject:model];
    //            }
    //
    //            [weakSelf reloadData];
    //            [weakSelf.scrollFootView loadMoreComplete];
    //        });
    //    }];
    
    
}



//@override method
-(BaseTabViewCell*) buildTableViewCell{
    
    self.mCellView = [[DevicesTabCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"QiuckWordsCell"];
    self.mCellView.clickListener = self;
    return self.mCellView;
    
}

//- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section{
//    return 1;
//}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return [self.dataList count];
//}

//实现单元格的协议接口
- (void)onClick:(UIView *)view data:(BaseModel *)data{
    NSUInteger index = [self.dataList indexOfObject:data];
   
    NSArray *indexPaths = @[
                            [NSIndexPath indexPathForRow:index + 1 inSection:0]
                            
                            ];
    
    
    for(int i = 0;i < 1; i ++){
        
        DevicesEntity* model = [[DevicesEntity alloc] init];
        model.name = [NSString stringWithFormat:@"A+%d",index];
        [self.dataList insertObject:model atIndex:index + 1];
    
    }
    //局部section刷新
    //NSIndexSet *nd = [[NSIndexSet alloc] initWithIndex:0]; //刷新第1个section
    //[self reloadSections:nd withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
    //[self reloadData];
    
}


//@override method
-(CGFloat) getCellHeight{
    
    return 50.0f;
}


//重载父类方法--本类使用父类的底部视图
-(ScrollViewRefreshView*) buildFootView{
    
    return [super buildFootView];
}

//override method
-(void(^)(void)) buildLoadMoreListener{
    
    
    __weak __typeof(&*self)weakSelf = self;
    
    LoadMoreBlock loadMore = ^(){
        
        
        if(weakSelf.dataList.count > 10){
            
            weakSelf.scrollFootView.loadMoreState = LoadMoreNoMoreData;
            return ;
        }
        
        double delayTime = 3.0;
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, delayTime * NSEC_PER_SEC);
        dispatch_after(time, dispatch_get_main_queue(), ^{
            
            for(int i = 0;i < 3; i ++){
                
                DevicesEntity* model = [[DevicesEntity alloc] init];
                model.name = [NSString stringWithFormat:@"loadmore data:%d",i];
                [weakSelf.dataList addObject:model];
            }
            [weakSelf reloadData];
            [weakSelf.scrollFootView loadMoreComplete];
        });
        
    };
    
    return loadMore;
}


@end
