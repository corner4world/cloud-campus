var app = getApp()
var that;
Page({
  onLoad: function (options) {
    that = this;
    that.setData({//初始化数据
      picSrc: [],
      isSrc: false,
      ishide: "0",
      autoFocus: true,
      isLoading: false,
      loading: true,
      isdisabled: false
    })
  },
  onReady: function () {
    wx.hideToast()
  },
  onShow: function () {
    var myInterval = setInterval(getReturn, 500);
    function getReturn() {
      wx.getStorage({
        key: 'user_openid',
        success: function (ress) {
          if (ress.data) {
            clearInterval(myInterval)
            that.setData({
              loading: true
            })
          }
        }
      })
    }
  },
  uploadPic: function () {//选择图标
    wx.chooseImage({
      sizeType: ['original', 'compressed'],
      sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
      success: function (res) {
        var tempFilePaths = res.tempFilePaths
        var pics = that.data.picSrc
        for(var index in tempFilePaths){
          pics.push({"src":tempFilePaths[index]})
        }
        that.setData({
          isSrc: true,
          picSrc: pics
        })
      }
    })
  },
  clearPic: function (e) {//删除图片
    var that = this 
    var index = e.target.id
    var pics = that.data.picSrc
    pics.splice(index,1)
    that.setData({
      isSrc: false,
      picSrc: pics
    })
  },
  changePublic: function (e) {//switch开关
    console.log(e.detail.value)
    if (e.detail.value == true) {
      wx.showModal({
        title: '邮寄心情',
        content: '确定要将该心情邮寄出去吗？（邮寄出去的心情将在信箱模块显示，任何人都可看到）',
        showCancel: true,
        confirmColor: "#a07c52",
        cancelColor: "#646464",
        success: function (res) {
          if (res.confirm) {
            that.setData({
              ishide: "1"
            })
          }
          else {
            that.setData({
              isPublic: true
            })
          }
        }
      })

    }
    else {
      wx.showModal({
        title: '退回心情',
        content: '确定要将该心情退回吗？（退回的心情将在信箱模块消失，不再显示）',
        showCancel: true,
        confirmColor: "#a07c52",
        cancelColor: "#646464",
        success: function (res) {
          if (res.confirm) {
            that.setData({
              ishide: "0"
            })
          }
          else {
            that.setData({
              isPublic: false
            })
          }
        }
      })

    }
  },
  sendNewMood: function (e) {
    //判断心情是否为空
    var content = e.detail.value.content;
    var title = e.detail.value.title;
    console.log(content)
    if (content == "") {
      common.dataLoading("心情内容不能为空", "loading");
    }
    else {
      that.setData({
        isLoading: true,
        isdisabled: true
      })
      wx.getStorage({
        key: 'user_id',
        success: function (ress) {
          var Diary = Bmob.Object.extend("Diary");
          var diary = new Diary();
          var me = new Bmob.User();
          me.id = ress.data;
          diary.set("title", title);
          diary.set("content", content);
          diary.set("is_hide", that.data.ishide);
          diary.set("publisher", me);
          diary.set("likeNum", 0);
          diary.set("commentNum", 0);
          diary.set("liker", []);
          if (that.data.isSrc == true) {
            var name = that.data.src;//上传的图片的别名
            var file = new Bmob.File(name, that.data.src);
            file.save();
            diary.set("pic", file);
          }
          diary.save(null, {
            success: function (result) {
              that.setData({
                isLoading: false,
                isdisabled: false
              })
              // 添加成功，返回成功之后的objectId（注意：返回的属性名字是id，不是objectId），你还可以在Bmob的Web管理后台看到对应的数据
              common.dataLoading("发布心情成功", "success", function () {
                wx.navigateBack({
                  delta: 1
                })
              });
            },
            error: function (result, error) {
              // 添加失败
              console.log(error)
              common.dataLoading("发布心情失败", "loading");
              that.setData({
                isLoading: false,
                isdisabled: false
              })

            }
          });


        }
      })


    }

  },
  onPullDownRefresh: function () {
    wx.stopPullDownRefresh()
  }
})
