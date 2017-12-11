/*!
 * App Javascript v1.1.1
 * Author: Smile
 * Date: 2017-12-10
 */

//解决移动端300毫秒延迟
window.addEventListener('load', function () {
  FastClick.attach(document.body);
}, false);

var swiper = new Swiper('.swiper-container', {
  autoHeight: true, //enable auto height
  spaceBetween: 20,
  pagination: {
    el: '.swiper-pagination',
    clickable: true,
  },
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
});


//成员变量
var url = $('#mp3dataid').data('mp3');//（设定文件路径）
if(url){    
    var pausedimg = "/public/static/images/icon-paused.png";
    var playedimg = "/public/static/images/icon-play.png";
    var div = document.getElementById('divplayer');  
    var player = document.getElementsByTagName('audio')[0];
    player.src = url;
}
//文件长度(秒)
var fileseconds = 0;
//定时器对象
var progressStateTimer;
//进度条父容器宽度
var barboxwidth = 0;
//进度条当前宽度
var currentbarwidth = 0;
//每秒追加宽度
var appendwidth = 0;
//进度条对象
var bar;
//当前运行秒数
var currentseconds = 0;

function play() {
    if (player && player.paused) {

        //获取文件时长
        fileseconds = parseInt(player.duration);
        //显示文件时长
        document.getElementById("showtime").innerHTML = (formatTime(fileseconds));
        //获取进度条的容器宽度
        barboxwidth = document.getElementById("barbox").style.width;

        //获取容器变量备用
        bar = document.getElementById("bar");
        //开始播放
        player.play();
        //显示暂停按钮
        document.getElementById("icon").src = pausedimg;
        //执行进度条方法
        progressStateTimer = setInterval(prossbar, 1000);
    } else if (player && player.played) {
        //暂停并停止进度条
        player.pause();
        //显示播放按钮
        document.getElementById("icon").src = playedimg;
        //停止进度条
        clearInterval(progressStateTimer);
    }
    else {
        //进到此处说明player未实例化 或者状态不是播放和暂停
        //dosomething
    }
}




var prossbar = function () {

    if (fileseconds > 0) {
        //重新计算新的宽度
        
        if (currentseconds == 0) {
            appendwidth = 0;
        } else
        {
            appendwidth = (currentseconds / fileseconds) * 100;
        }
        
        bar.style.width = appendwidth + "%";
        //显示当前播放的时间
        document.getElementById("currenttime").innerHTML = formatTime(currentseconds);
        currentseconds++;
        if (currentseconds > fileseconds || currentbarwidth >= barboxwidth) {
            //停止播放并清除进度条计时器
            player.pause();
            clearInterval(progressStateTimer);
        }
    }
}

function formatTime(second) {
    return [parseInt(second / 60 % 60), parseInt(second % 60)].join(":")
    .replace(/\b(\d)\b/g, "0$1");
}
