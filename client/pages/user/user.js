const app = getApp()
var config = require('../../config')
Page({
  data: {
    items: [
      {
        icon: 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/account.png',
        text: '账号信息',
        path: '/pages/user/account/account'
      },
      {
        icon: 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/album.png',
        text: '班级相册',
        path: '/pages/address/list/index'
      },
      {
        icon: 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/hot-line.png',
        text: '客户热线',
        path: '18282030093',
      },
      {
        icon: 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/opinion.png',
        text: '反馈意见',
        path: '/pages/help/list/index',
      },
    ],
    settings: [
      {
        icon: 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/clear.png',
        text: '清除缓存',
        path: ''
      },
      {
        icon: 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/about.png',
        text: '关于我们',
        path: '/pages/about/index'
      },
    ],
    storage:0,
    username:'',
    avatar:'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png'
  },
  onLoad() {
    var that = this 
    var user = app.user
    that.setData({
      username: user.username,
      avatar:user.avatar
    })
    var settings = that.data.settings
    wx.getStorageInfo({
      success: function(res) {
        settings[0].path = res.currentSize+'kb'
        that.setData({
          settings: settings
        })
      },
    })
  },
  navigateTo(e) {
    const index = e.currentTarget.dataset.index
    const path = e.currentTarget.dataset.path
    wx.navigateTo({
      url: path,
    })
  },
  bindtap(e) {
    var that = this 
    const index = e.currentTarget.dataset.index
    switch(index){
      case 0:
        var settings = that.data.settings
        wx.showModal({
          title: '友情提示',
          content: '确定要清除缓存吗？',
          success:function(res){
            if(res.confirm){
              wx.clearStorage()
              settings[0].path = '0kb'
              that.setData({
                settings: settings
              })
            }
          }
        })
        break
      case 1:
        //todo 关于我们
        break
    }
    
  },
  logout(){
    wx.showModal({ title: '友情提示', content: '确定要登出吗？',
      success:function(res){
        if(res.confirm){
          wx.reLaunch({
            url: '/pages/login/login',
          })
        }
      }
    })
  },
  changeAvatar:function(){
    var that = this
    wx.chooseImage({
      count: 1,
      sizeType: ['original', 'compressed'],
      sourceType: ['album', 'camera'],
      success(res) {
        const tempFilePaths = res.tempFilePaths[0]
        console.log(tempFilePaths)
        wx.uploadFile({
          url: config.host + '/weapp/upload',
          filePath: tempFilePaths,
          name: 'file',
          success(res){
            var data = JSON.parse(res.data)
            var avatar = data.data.imgUrl
            that.setData({
              avatar: avatar
            })
            that.confirm('avatar',avatar)
          }
        })
      }
    })
  },
  confirm: function (field, value) {
    var that = this
    wx.request({
      method: 'post',
      data: {
        user: app.user,
        field: field,
        value: value
      },
      url: config.host + '/weapp/account_modify',
      success: function (res) {
        var status = res.data.data.status
        var user = res.data.data.user
        if (status && res.statusCode === 200 && res.data.code != -1) {
          app.user = user
          wx.showToast({
            title: '修改成功',
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
  }
})