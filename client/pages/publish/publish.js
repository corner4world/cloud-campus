var config = require('../../config')
import { $wuxSelect } from '../../ui/wux/index'
var app = getApp()
var that;
Page({
  onLoad: function (options) {
    that = this;
    that.setData({
      host: config.host,
      autoFocus: true,
      isLoading: false,
      loading: true,
      isdisabled: false,
      pictures:[],
      type_value: 0,
      type_title: '公告',
      class_hidden:true,
      homework_type_hidden:true,
      class_value: '',
      class_title: '',
      homework_type_value:'',
      homework_type_title:'',
      fileList: [],
      publish_type:options.publish_type,
      class_category:[],
      homework_type:[],
    })
    if (options.publish_type == 1){
      this.setData({
        class_hidden: false,
        homework_type_hidden:false
      })
      this.getClass()
      this.getHomeworkType()
    }
    if (options.publish_type == 2) {
      this.setData({
        class_hidden: false,
      })
      this.getClass()
    }
    
    
  },
  onReady: function () {
    wx.hideToast()
  },
  getClass:function(){
    wx.request({
      method: 'post',
      data: {
        user: app.user,
      },
      url: config.host + '/weapp/class_category',
      success: function (res) {
        console.log(res)
        var class_category = res.data.data.result[0]
        if (class_category.length && res.statusCode === 200) {
          that.setData({
            class_category:class_category
          })
        }
      },
      fail: function (res) {
        wx.hideToast();
      }
    })
  },
  getHomeworkType: function () {
    wx.request({
      method: 'post',
      url: config.host + '/weapp/subject',
      success: function (res) {
        console.log(res)
        var homework_type = res.data.data.result[0]
        if (homework_type.length && res.statusCode === 200) {
          that.setData({
            homework_type: homework_type
          })
        }
      },
      fail: function (res) {
        wx.hideToast();
      }
    })
  },
  sendNewMood: function (e) {
    var content = e.detail.value.content;
    var title = e.detail.value.title;
    if (content == "" || title == "") {
      app.showErrorModal('标题和正文正文不能为空', '提醒');
    }
    else {
      that.setData({
        isLoading: true,
        isdisabled: true
      })
      
      app.showLoadToast('发布中');
      wx.request({
        method: 'post',
        data: {
          title: title,
          content: content,
          pictures: that.data.pictures,
          class_value:that.data.class_value,
          publish_type:that.data.publish_type,
          homework_type_value:that.data.homework_type_value,
          user:app.user
        },
        url: config.host + '/weapp/publish',
        success: function (res) {
          console.log(res)
          var status = res.data.data.status
          if (status == 1 && res.statusCode === 200 && res.data.code != -1) {
            wx.showToast({
              title: '发布成功!',
              icon: 'none',
              duration: 2000
            })
            //跳转
          }
          else if (status == 0 && res.statusCode === 200 && res.data.code != -1) {
            wx.showToast({
              title: '发布失败,请稍后重试',
              icon: 'none',
              duration: 2000
            })
          } 
        },
        fail: function (res) {
          wx.hideToast();
          app.showErrorModal(res.errMsg, '发布失败,服务器维护中');
        }
      })
      that.setData({
        isLoading: false,
        isdisabled: false
      })
    }

  },
  onPullDownRefresh: function () {
    wx.stopPullDownRefresh()
  },
  class_choose() {
    $wuxSelect('#class-select').open({
      value: this.data.class_value,
      multiple: true,
      options: this.data.class_category,
      onConfirm: (value, index, options) => {
        console.log(value, index, options)
        this.setData({
          class_value: value,
          class_title: index.map((n) => options[n].title),
        })
      },
    })
  },
  homework_type_choose() {
    $wuxSelect('#homework_type-select').open({
      value: this.data.homework_type_value,
      multiple: false,
      options: this.data.homework_type,
      onConfirm: (value, index, options) => {
        this.setData({
          homework_type_value: value,
          homework_type_title: options[index].title,
        })
      },
    })
  },
  onSuccess(e) {
    //选择图片成功
  },
  onFail(e) {
    app.showErrorModal('上传图片失败,请重试', '提醒');
    this.setData({
      fileList: []
    })
  },
  onComplete(e) {
    var data = e.detail.data
    var data = JSON.parse(data)
    that.data.pictures.push(data.data.imgUrl)
    wx.hideLoading()
  },
  onPreview(e) {
    const { file, fileList } = e.detail
    wx.previewImage({
      current: file.url,
      urls: fileList.map((n) => n.url),
    })
  },
  onRemove(e) {
    const { file, fileList,index} = e.detail
    this.setData({
      fileList: fileList.filter((n) => n.uid !== file.uid),
    })
    var pics = that.data.pictures
    pics.splice(index,1)
    this.setData({
      pictures: pics
    })
  },
})
