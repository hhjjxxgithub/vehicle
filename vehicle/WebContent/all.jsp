<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>管理员登录</title>
</head>

<body>
  <div> <b style="font-size:16px; font-weight:bold; display:inline-block;position: absolute; left: 20px; line-height: 50px; font-family: '黑体'; ">公告</b>
    <ul class="news_li" style="line-height:50px;display:inline-block;font-size:16px;left:76px;top:0px; 
     position:absolute;font-family: '黑体'; ">
      <li style="list-style:none;font-family: '黑体';">公告1</li>
      <li style="list-style:none; font-family: '黑体';">公告2</li>
    </ul>
    <ul class="swap" style="line-height:50px;display:inline-block;font-size:16px; position:absolute;top:50px; left:76px;"></ul>
  </div>
</body>
<script>
$(function () {
  $('.swap').html($('.news_li').html());
  x = $('.news_li');
  y = $('.swap');
  h = $('.news_li li').length * 50; //19为每个li的高度
  var aaa = setInterval(b, 10000);
  $('.news_li li').hover(function () {
    clearInterval(aaa);
  }, function () {
    aaa = setInterval(b, 500);
  });
});

function b() {
  t = parseInt(x.css('top'));
  y.css('top', '50px');
  x.animate({
    top: t - 50 + 'px'
  }, 'slow'); //19为每个li的高度    
  if (Math.abs(t) == h) { //50为每个li的高度
    y.animate({
      top: '0px'
    }, 'slow');
    z = x;
    x = y;
    y = z;
  }
}
</script>
</html>