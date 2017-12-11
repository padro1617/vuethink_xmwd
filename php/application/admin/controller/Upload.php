<?php
// +----------------------------------------------------------------------
// | Description: 图片上传
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use think\Request;
use think\Controller;
use app\common\model;

class Upload extends Controller
{   
    public function index()
    {	
        // if(Request::instance()->isPost()) {
            header('Access-Control-Allow-Origin: *');
            header('Access-Control-Allow-Methods: POST');
            header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
            $file = request()->file('file');
            if (!$file) {
                return resultArray(['error' => '请上传文件']);
            }
            
            $info = $file->validate(['ext'=>'jpg,png,gif'])->move(ROOT_PATH . DS . 'public\static\images\uploads');
            if ($info) {
                return resultArray(['data' =>  'public\static\images\uploads'. DS .$info->getSaveName()]);
            }
            return resultArray(['error' =>  $file->getError()]);
    }
}
 