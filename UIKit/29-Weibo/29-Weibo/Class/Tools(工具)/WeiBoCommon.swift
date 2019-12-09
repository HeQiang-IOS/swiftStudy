//
//  WeiBoCommon.swift
//  Weibo
//
//  Created by 何强 on 2019/12/6.
//  Copyright © 2019 何强. All rights reserved.
//

import Foundation


// MARK: - 应用程序信息
/// 应用程序 ID
let WBAppKey = "3216380832"
/// 应用程序加密信息(开发者可以申请修改)
let WBAppSecret = "415a1932f3a79577ff1979606e55ebed"
/// 回调地址 - 登录完成调转的 URL，参数以 get 形式拼接
let WBRedirectURI = "http://ios.itcast.cn"

// MARK: - 全局通知定义
/// 用户需要登录通知
let WBUserShouldLoginNotification = "WBUserShouldLoginNotification"
/// 用户登录成功通知
let WBUserLoginSuccessedNotification = "WBUserLoginSuccessedNotification"

// MARK: - 照片浏览通知定义
/// @param selectedIndex    选中照片索引
/// @param urls             浏览照片 URL 字符串数组
/// @param parentImageViews 父视图的图像视图数组，用户展现和解除转场动画参照
/// 微博 Cell 浏览照片通知
let WBStatusCellBrowserPhotoNotification = "WBStatusCellBrowserPhotoNotification"
/// 选中索引 Key
let WBStatusCellBrowserPhotoSelectedIndexKey = "WBStatusCellBrowserPhotoSelectedIndexKey"
/// 浏览照片 URL 字符串 Key
let WBStatusCellBrowserPhotoURLsKey = "WBStatusCellBrowserPhotoURLsKey"
/// 父视图的图像视图数组 Key
let WBStatusCellBrowserPhotoImageViewsKey = "WBStatusCellBrowserPhotoImageViewsKey"

// MARK: - 微博配图视图常量
// 配图视图外侧的间距
let WBStatusPictureViewOutterMargin = CGFloat(12)
// 配图视图内部图像视图的间距
let WBStatusPictureViewInnerMargin = CGFloat(3)
// 视图的宽度的宽度
let WBStatusPictureViewWidth = UIScreen.cz_screenWidth() - 2 * WBStatusPictureViewOutterMargin
// 每个 Item 默认的宽度
let WBStatusPictureItemWidth = (WBStatusPictureViewWidth - 2 * WBStatusPictureViewInnerMargin) / 3

