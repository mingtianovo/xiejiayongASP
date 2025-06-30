<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>联系客服</title>
    <meta charset="utf-8" />
    <style>
        body { font-family: 'Microsoft YaHei', Arial, sans-serif; background: #f4f6f8; margin: 0; padding: 0; }
        .container { max-width: 500px; margin: 40px auto; background: #fff; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); padding: 32px; }
        h2 { text-align: center; color: #2d8cf0; margin-bottom: 24px; }
        .contact-info { margin-bottom: 24px; }
        .contact-info p { margin: 8px 0; color: #333; font-size: 15px; }
        .form-group { margin-bottom: 16px; }
        label { display: block; margin-bottom: 6px; color: #333; }
        input, textarea { width: 100%; padding: 8px; border-radius: 6px; border: 1px solid #ccc; font-size: 15px; }
        textarea { resize: vertical; min-height: 60px; }
        .btn { background: #2d8cf0; color: white; padding: 10px 0; border: none; border-radius: 6px; cursor: pointer; width: 100%; font-size: 16px; margin-top: 10px; }
        .btn:hover { background: #1e6fd9; }
        .msg { text-align: center; margin-top: 18px; color: #27ae60; }
    </style>
</head>
<body>
    <div class="container">
        <h2>联系客服</h2>
        <div class="contact-info">
            <p>客服电话：400-888-8888</p>
            <p>客服邮箱：service@hotel.com</p>
            <p>工作时间：9:00 - 18:00（周一至周日）</p>
        </div>
        <% string msg = "";
           if (Request.HttpMethod == "POST") {
               string name = Request.Form["name"];
               string content = Request.Form["content"];
               if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(content)) {
                   msg = "请填写您的姓名和留言内容！";
               } else {
                   msg = "您的留言已提交，客服会尽快与您联系！";
               }
           }
        %>
        <form method="post">
            <div class="form-group">
                <label>您的姓名：</label>
                <input type="text" name="name" required />
            </div>
            <div class="form-group">
                <label>留言内容：</label>
                <textarea name="content" required></textarea>
            </div>
            <button type="submit" class="btn">提交留言</button>
        </form>
        <% if (!string.IsNullOrEmpty(msg)) { %>
            <div class="msg"><%= msg %></div>
        <% } %>
    </div>
</body>
</html> 