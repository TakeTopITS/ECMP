/*
 * @Description: 
 * @Version: 
 * @Autor: MrSong
 * @Date: 2021-02-03 14:17:13
 * @LastEditors: MrSong
 * @LastEditTime: 2021-03-12 16:12:00
 */
; (function ($) {
  $.fn.extend({
    "initDrag": function (options) {
      //设置属性
      options = $.extend({
        id: this[0],
        leftMinWidth: '200',//左边最小宽度
        rightMinWidth: '500',//右边最小宽度
        dragClass: '.drag-box',//拖拽盒子类名
        leftClass: '.left',//左边盒子类名
        rightClass: '.right',//右边盒子类名
        resizeClass: '.resize',//拖拽按钮类名
        dragControllerDiv() {
          let resize = $(options.resizeClass);
          let leftBox = $(options.leftClass);
          let rightBox = $(options.rightClass);
          let box = $(options.dragClass);
          let leftMinWidth=parseFloat(options.leftMinWidth);
          let rightMinWidth=parseFloat(options.rightMinWidth);
          leftBox.css({
            "width":`${parseFloat(options.leftMinWidth)}px`,
          })
          rightBox.css({
            width:`calc(100% - ${parseFloat(options.leftMinWidth)+20}px)`
          })
          for (let i = 0; i < resize.length; i++) {
            // 鼠标按下事件
            resize[i].onmousedown = function (e) {
              //颜色改变提醒
              resize[i].style.background = '#002240';
              let startX = e.clientX;
              resize[i].left = resize[i].offsetLeft;
              // 鼠标拖动事件
              document.onmousemove = function (e) {
                let endX = e.clientX;
                let moveLen = resize[i].left + (endX - startX); // （endx-startx）=移动的距离。resize[i].left+移动的距离=左边区域最后的宽度
                let maxT = box[i].clientWidth - resize[i].offsetWidth; // 容器宽度 - 左边区域的宽度 = 右边区域的宽度
                if (moveLen < leftMinWidth) moveLen = leftMinWidth; // 左边区域的最小宽度为200px
                if (moveLen > maxT - rightMinWidth) moveLen = maxT - rightMinWidth; //右边区域最小宽度为500px
                resize[i].style.left = moveLen; // 设置左侧区域的宽度
                for (let j = 0; j < leftBox.length; j++) {
                  leftBox[j].style.width = moveLen + 'px';
                  rightBox[j].style.width = (box[i].clientWidth - moveLen - 20) + 'px';
                }
              };
              $(window).resize(() => {
                let currentWidth = leftBox[0].offsetWidth;
                let endX = e.clientX;
                let moveLen = resize[i].left + (endX - startX); // （endx-startx）=移动的距离。resize[i].left+移动的距离=左边区域最后的宽度
                let maxT = box[i].clientWidth - resize[i].offsetWidth; // 容器宽度 - 左边区域的宽度 = 右边区域的宽度
                if (moveLen < leftMinWidth) moveLen = leftMinWidth; // 左边区域的最小宽度为200px
                if (moveLen > maxT - rightMinWidth) moveLen = maxT - rightMinWidth; //右边区域最小宽度为500px
                resize[i].style.left = moveLen; // 设置左侧区域的宽度
                for (let j = 0; j < leftBox.length; j++) {
                  leftBox[j].style.width = currentWidth + 'px';
                  rightBox[j].style.width = (box[i].clientWidth - currentWidth - 20) + 'px';
                }
              });
              // 鼠标松开事件
              document.onmouseup = function (evt) {
                //颜色恢复
                resize[i].style.background = '#002240';
                document.onmousemove = null;
                document.onmouseup = null;
                resize[i].releaseCapture && resize[i].releaseCapture(); //当你不在需要继续获得鼠标消息就要应该调用ReleaseCapture()释放掉
              };
              resize[i].setCapture && resize[i].setCapture(); //该函数在属于当前线程的指定窗口里设置鼠标捕获
              return false;
            };
          }
        },
      }, options);
      options.dragControllerDiv()
      //返回对象，以便支持链式语法
      return this;
    }
  });
})(jQuery)
