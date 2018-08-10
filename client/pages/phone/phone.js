var WxSearch = require('../../utils/wxSearchView/wxSearchView.js');
var wxSortPickerView = require('../../utils/wxSortPickerView/wxSortPickerView.js');
var config = require('../../config')
Page({
  data: {
    phones: []
  },
  call:function(e){
    var phone = e.target.id;
    //var name = e.target.dataset.text;
    //todo 取消提示
    wx.makePhoneCall({
      phoneNumber: phone,
    })
  },
  onLoad: function (options) {
    var that = this;
    wx.request({
      method: 'post',
      data:{},//用户类型
      url: config.host + '/weapp/parent_phone',//todo 接口改成通用的
      success: function (res) {
        var phones = res.data.data.result
        if (phones.length && res.statusCode === 200) {
          that.setData({
            phones: phones
          })
          WxSearch.init(
            that,
            [],
            phones,// 搜索匹配，[]表示不使用
            that.mySearchFunction, // 提供一个搜索回调函数
            that.myGobackFunction //提供一个返回回调函数
          );
          //电话列表初始化
          wxSortPickerView.init(phones, that);
        } else {
          wx.showToast({
            title: '服务器维护中..',
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
  // 转发函数,固定部分
  wxSearchInput: WxSearch.wxSearchInput,  // 输入变化时的操作
  wxSearchKeyTap: WxSearch.wxSearchKeyTap,  // 点击提示或者关键字、历史记录时的操作
  wxSearchConfirm: WxSearch.wxSearchConfirm,  // 搜索函数
  wxSearchClear: WxSearch.wxSearchClear,  // 清空函数
})