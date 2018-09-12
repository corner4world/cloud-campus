var config = require('../../../config')
var WxParse = require('../../../utils/wxParse/wxParse.js');
var app = getApp();
Page({
  data: {
    id:"",
    activity: "",
    likes:0,//点赞数,
    like_enabled:true,
    content: "",//评论框的内容
    isLoading: true,//是否显示加载数据提示
    disabled: true,
    limit:5,
    offset:0,
    comments: [
      {
        avatar: "http://pbqg2m54r.bkt.clouddn.com/logo.png",
        uName: "😝雨碎江南",
        create_date: "2016-12-11",
        content: "点赞"
      },
    ],
  },
  onLoad: function (options) {
    var that = this
    that.setData({
      id: options.id
    })
    var id = options.id
    this.click()
    this.fetchData(id)
    this.fetchComment(0,5)
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
            activity: activity[0],
            likes:activity[0].likes
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
    var offset = that.data.offset
    var limit = that.data.limit + 5
    that.fetchComment(offset,limit)
    that.setData({
      limit:limit,
      isLoading: false
    })
    /*
    if (that.data.comments.length <= that.data.activity.comments){
      that.setData({
        isLoading: false
      })
    }*/
  },

  //文本域失去焦点时 事件处理
  textAreaBlur: function (e) {
    //获取此时文本域值
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
          operation:"comment_insert"
        },
        url: config.host + '/weapp/like_comment',
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
  fetchComment:function(offset,limit){
    var that = this
    wx.request({
      method: 'post',
      data: {
        id: that.data.id,
        offset:offset,
        limit:limit,
        operation: "comment_select"
      },
      url: config.host + '/weapp/like_comment',
      success: function (res) {
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
  },
  like:function(){
    var that = this
    if(that.data.like_enabled){
      wx.request({
        method: 'post',
        data: {
          id: that.data.id,
          //user:app.user,
          operation: "like"
        },
        url: config.host + '/weapp/like_comment',
        success: function (res) {
          console.log(res)
          var status = res.data.data.status
          if (status == 1 && res.statusCode === 200 && res.data.code != -1) {
            var likes = that.data.likes + 1
            that.setData({
              likes: likes,
              like_enabled:false
            })
          } else if (status != 1 && res.statusCode === 200 && res.data.code != -1) {
            wx.showToast({
              title: '未知错误,请稍后重试',
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
    else{
      wx.showToast({
        title: '您已赞过',
        icon: 'none',
        duration: 2000
      })
    }
  },
  click: function () {
      var that = this
      wx.request({
        method: 'post',
        data: {
          id: that.data.id,
          //user:app.user,
          operation: "click"
        },
        url: config.host + '/weapp/like_comment'
      })
  },
})