<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>账单管理</title>
    <meta charset="utf-8" />
    <style>
        body {
            font-family: 'Microsoft YaHei', '微软雅黑', 'SimSun', '宋体', Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1000px;
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
        .btn {
            background: #2d8cf0;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            margin-right: 5px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f8f9fa;
            font-weight: bold;
        }
        .amount {
            font-weight: bold;
            color: #2d8cf0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>账单管理</h2>
        <div style="margin-bottom: 20px;">
            <a href="Admin/AdminHome.aspx" class="btn btn-secondary">返回仪表板</a>
        </div>
        <table>
            <thead>
                <tr>
                    <th>账单ID</th>
                    <th>订单ID</th>
                    <th>客户</th>
                    <th>房间</th>
                    <th>入住日期</th>
                    <th>退房日期</th>
                    <th>总金额</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>1</td>
                    <td>张三</td>
                    <td>101</td>
                    <td>2024-01-15</td>
                    <td>2024-01-17</td>
                    <td class="amount">¥600</td>
                    <td>已支付</td>
                    <td>
                        <a href="BillDetail.aspx?id=1" class="btn">查看</a>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>2</td>
                    <td>李四</td>
                    <td>102</td>
                    <td>2024-01-16</td>
                    <td>2024-01-19</td>
                    <td class="amount">¥900</td>
                    <td>待支付</td>
                    <td>
                        <a href="BillDetail.aspx?id=2" class="btn">查看</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html> 