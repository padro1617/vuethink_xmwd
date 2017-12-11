<?php
//use think\Route;
//
//Route::rule('/','home/index/index','GET|POST'); // 定义GET请求路由规则
//Route::rule('2','home/index/bind','GET|POST'); // 定义GET请求路由规则
//Route::rule('3','home/index/limit','GET|POST'); // 定义GET请求路由规则
//Route::rule('4','home/index/platform','GET|POST'); // 定义GET请求路由规则
//Route::rule('5','home/index/tips','GET|POST'); // 定义GET请求路由规则


return [
// 【基础】登录
    '/' => ['home/index/index', ['method' => 'GET|POST|OPTIONS']],
//推广的链接地址
    't/:tcode' => ['home/index/index', ['method' => 'GET|POST|OPTIONS']],
    'huishou' => ['home/index/huishou', ['method' => 'GET|POST|OPTIONS']],
    'zhekou' => ['home/index/zhekou', ['method' => 'GET|POST|OPTIONS']]
];