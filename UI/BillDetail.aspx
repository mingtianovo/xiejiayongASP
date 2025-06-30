<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>账单详情</title>
    <meta charset="utf-8" />
    <style>
        body {
            font-family: 'Microsoft YaHei', '微软雅黑', 'SimSun', '宋体', Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            padding: 32px;
        }
        h2 {
            text-align: center;
            color: #2d8cf0;
            margin-bottom: 32px;
        }
        .bill-info {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .bill-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding: 8px 0;
            border-bottom: 1px solid #eee;
        }
        .bill-row:last-child {
            border-bottom: none;
            font-weight: bold;
            font-size: 18px;
            color: #2d8cf0;
        }
        .btn {
            background: #2d8cf0;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
            margin-right: 10px;
        }
        .btn:hover {
            background: #1e6fd9;
        }
        .btn-secondary {
            background: #6c757d;
        }
        .btn-secondary:hover {
            background: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>账单详情</h2>
        <div class="bill-info">
            <div class="bill-row">
                <span>账单ID：</span>
                <span>1</span>
            </div>
            <div class="bill-row">
                <span>订单ID：</span>
                <span>1</span>
            </div>
            <div class="bill-row">
                <span>客户姓名：</span>
                <span>张三</span>
            </div>
            <div class="bill-row">
                <span>房间号：</span>
                <span>101</span>
            </div>
            <div class="bill-row">
                <span>入住日期：</span>
                <span>2024-01-15</span>
            </div>
            <div class="bill-row">
                <span>退房日期：</span>
                <span>2024-01-17</span>
            </div>
            <div class="bill-row">
                <span>房间类型：</span>
                <span>标准单人间</span>
            </div>
            <div class="bill-row">
                <span>日租金：</span>
                <span>¥200</span>
            </div>
            <div class="bill-row">
                <span>住宿天数：</span>
                <span>2</span>
            </div>
            <div class="bill-row">
                <span>总金额：</span>
                <span>¥400</span>
            </div>
            <div class="bill-row">
                <span>状态：</span>
                <span>已支付</span>
            </div>
        </div>
        <div style="text-align: center;">
            <a href="BillList.aspx" class="btn btn-secondary">返回账单列表</a>
            <a href="Admin/AdminHome.aspx" class="btn">返回仪表板</a>
        </div>
    </div>
</body>
</html> 