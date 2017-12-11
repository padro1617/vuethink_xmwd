<?php
namespace app\home\controller;
use app\common\controller\Common;
use think\Db;
use think\Request;
use app\common\model;

class Index extends Common
{
    // 这是THinkphp下的自动运行的方法，所有继承这个控制器的子类
    // 首先运行此方法
    // public function _initialize()
    // {
    //     define('SID', is_login());
    //     if (!SID) {
    //         set_redirect_url($_SERVER['REQUEST_URI']);
    //         $this->redirect('Login/login');
    //     }
    //     //权限认证
    //     $auth = new \Auth\Auth();
    //     $request = Request::instance();
    //     if (!$auth->check($request->module() . '-' . $request->controller() . '-' . $request->action(), SID)) {// 第一个参数是规则名称,第二个参数是用户UID
    //         /* return array('status'=>'error','msg'=>'有权限！');*/
    //         $this->error('你没有权限');
    //     }
    // }
    /**
     * 登录
     * 短信验证码
     * $date=date('Y-m-d H:i:s',"1285724523");
     */
    public function index(){
        $postModel = model('Post');
        $postlist=$postModel->where(array('type'=>'首页'))->select();
        $this->assign('postlist',$postlist);

        $systemConfig = model('admin/SystemConfig')->getDataList();
        $this->assign('mp3',$systemConfig['MP3']);


        return view();
    }
    public function huishou(){
        if(Request::instance()->isPost()) {
            $param = $this->param;
            $current = $param['current'];
            $pagesize = $param['pagesize'];
            $pageindex = ($current-1)*$pagesize;

            $StructureModel = model('Structure');
            $Structurelist=$StructureModel->limit($pageindex,$pagesize)->order('id', 'desc')->select();
            $this->assign('Structurelist',$Structurelist);

            $pagecount=$StructureModel->count();
            return resultArray(['data' =>array(
                'list'=>$Structurelist,
                'pagecount'=>$pagecount
                )]);
        }
        $postModel = model('Post');
        $postlist=$postModel->where(array('type'=>'回收页'))->select();
        $this->assign('postlist',$postlist);
        // $systemConfig = model('admin/SystemConfig')->getDataList();
        // $this->assign('mp3',$systemConfig['MP3']);
       
        return view();
    }
    public function zhekou(){
        $postModel = model('Post');
        $postlist=$postModel->where(array('type'=>'规则页'))->select();
        $this->assign('postlist',$postlist);

        $systemConfig = model('admin/SystemConfig')->getDataList();
        $this->assign('guizhe',$systemConfig['GUIZHE']);
        return view();
    }

}