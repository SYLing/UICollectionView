//
//  ViewController.m
//  照片查看器
//
//  Created by 邵银岭 on 15/8/29.
//  Copyright (c) 2015年 邵银岭. All rights reserved.
//

#import "ViewController.h"
#import "YLCollectionViewCell.h"
#import "YLCollectionViewFlowLayout.h"
#import "YLShowPictureViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
/** 模型数组 */
@property(nonatomic,strong)NSMutableArray *array;
@end

@implementation ViewController

static NSString * const ID = @"shopcell";

- (NSMutableArray *)array
{
    if(!_array){
        _array = [NSMutableArray array];
        for (int i = 0; i < 20; i++) {
            [_array addObject:[NSString stringWithFormat:@"%d",i + 1]];
        }
        
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollectionView];
}

#pragma mark 初始化
- (void)setupCollectionView{
    YLCollectionViewFlowLayout *layout = [[YLCollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 200) collectionViewLayout:layout];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YLCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
}

#pragma mark <UICollectionViewDataSource>
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.image = self.array[indexPath.item];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.array.count;
}

#pragma mark<UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YLShowPictureViewController *showPicture = [[YLShowPictureViewController alloc] init];
    showPicture.imageName = self.array[indexPath.row];
    [self presentViewController:showPicture animated:NO completion:nil];
    
}
@end
