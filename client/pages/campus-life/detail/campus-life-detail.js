var config = require('../../../config')
var WxParse = require('../../../utils/wxParse/wxParse.js');
var app = getApp();
Page({
  data: {
    id:"",
    activity: "",
    content: "",//评论框的内容
    isLoading: true,//是否显示加载数据提示
    disabled: true,
    _index: 0, //上拉加载
    comments: [
      {
        avatar: "http://pbqg2m54r.bkt.clouddn.com/logo.png",
        uName: "😝雨碎江南",
        create_date: "2016-12-11",
        content: "九九八十一难，最难过的，其实是女儿国这一关，因为比起其他的艰难困苦来说，此时的唐僧是真的动心了。"
      },
    ],
  },
  onLoad: function (options) {
    var that = this
    that.setData({
      id: options.id
    })
    var id = options.id
    this.fetchData(id)
    this.fetchComment(5)
  },
  onPullDownRefresh: function () {
    wx.stopPullDownRefresh();
  },
  fetchData: function (id) {
    var that = this
    wx.request({
      method: 'post',
      data: {
        id: id
      },
      url: config.host + '/weapp/campus_life_detail',
      success: function (res) {
        var activity = res.data.data.result
        if (activity.length && res.statusCode === 200 && res.data.code != -1) {
          that.setData({
            activity: activity[0]
          })
          var content = activity[0].content
          WxParse.wxParse('article', 'html', content, that, 0);
          setTimeout(function () {
            that.setData({
              hidden: true
            })
          }, 300)
        } else if (activity.length < 1 && res.statusCode === 200 && res.data.code != -1) {
          that.setData({
            hidden: true
          })
          wx.showToast({
            title: '详细内容被删除',
            icon: 'none',
            duration: 2000
          })
        }
      },
      fail: function (res) {
        wx.hideToast();
        app.showErrorModal(res.errMsg, '服务器维护中');
      }
    })
  },
  //上拉加载
  onReachBottom: function () {
    var conArr = [], that = this;
    console.log("onReachBottom")
    if (that.data._index < 1) {
      for (var i = 0; i < 1; i++) {
        conArr.push({
          avatar: "http://pbqg2m54r.bkt.clouddn.com/logo.png",
          uName: "雨碎江南",
          create_date: "2018-09-28",
          content: "我是上拉加载的新数据" + i
        })

      }
      //模拟网络加载
      setTimeout(function () {
        that.setData({
          comments: that.data.comments.concat(conArr)
        })
      }, 1000)
    } else {
      that.setData({
        isLoading: false
      })
    }
    ++that.data._index;
  },

  //文本域失去焦点时 事件处理
  textAreaBlur: function (e) {
    //获取此时文本域值
    console.log(e.detail.value)
    this.setData({
      content: e.detail.value
    })

  },
  //发送评论 事件处理
  send: function () {
    var that = this, conArr = [];
    var content = that.data.content.trim()
    if (content == ""){
        app.showErrorModal('内容不能为空', '提醒');
      }
    else{
      wx.request({
        method: 'post',
        data: {
          id: that.data.id,
          //user:app.user,
          content: content,
          operation:"insert"
        },
        url: config.host + '/weapp/comment',
        success: function (res) {
          var status = res.data.data.status
          if (status == 1 && res.statusCode === 200 && res.data.code != -1) {
            wx.showToast({
              title: '评论成功!',
              icon: 'none',
              duration: 2000
            })
            conArr.push({
              avatar: "http://pbqg2m54r.bkt.clouddn.com/logo.png",
              uName: "雨碎江南",
              create_date: "2018-08-09",
              content: that.data.content
            })
            that.setData({
              comments: that.data.comments.concat(conArr),
              content: "",//清空文本域值
            })
          } else if (status !=1 && res.statusCode === 200 && res.data.code != -1) {
            wx.showToast({
              title: '未知错误,评论失败,请稍后重试',
              icon: 'none',
              duration: 2000
            })
          }
        },
        fail: function (res) {
          wx.hideToast();
          app.showErrorModal(res.errMsg, '服务器维护中,请稍后重试');
        }
      })
    }
  },
  fetchComment:function(limit){
    var that = this
    wx.request({
      method: 'post',
      data: {
        id: that.data.id,
        limit:limit,
        operation: "select"
      },
      url: config.host + '/weapp/comment',
      success: function (res) {
        console.log("评论")
        console.log(res)
        var comments = res.data.data.result
        if (comments.length && res.statusCode === 200 && res.data.code != -1) {
          that.setData({
            comments: comments
          })
        }
      },
      fail: function (res) {
        wx.hideToast();
        app.showErrorModal(res.errMsg, '服务器维护中');
      }
    })
  }
})