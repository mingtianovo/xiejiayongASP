# 格林酒店管理系统

## 项目简介
基于ASP.NET Web Forms的酒店管理系统，采用三层架构设计，支持MySQL数据库。

## 技术栈
- **前端**: ASP.NET Web Forms, HTML, CSS, JavaScript
- **后端**: C#, ASP.NET
- **数据库**: MySQL
- **架构**: 三层架构 (UI层, BLL层, DAL层)

## 运行步骤

### 1. 环境准备
- Visual Studio 2019/2022
- .NET Framework 4.7.2
- MySQL 5.7+

### 2. 数据库配置
1. 启动MySQL服务
2. 执行SQL脚本：`AllTables_MySQL.sql`
3. 检查 `Web.config` 中的连接字符串

### 3. 运行项目
1. 双击 `Hotel.sln` 打开解决方案
2. 右键点击 `UI/Login.aspx` → 设为起始页
3. 按 `F5` 运行项目

## 测试账号

### 管理员账号
- **用户名**: admin
- **密码**: admin123
- **角色**: 系统管理员

### 普通用户账号
- **用户名**: user1
- **密码**: user123
- **角色**: 普通用户

## 功能模块

### 系统管理员
- 用户管理
- 客房管理
- 订单管理
- 系统设置

### 普通用户
- 客房预订
- 订单查询
- 个人信息管理

## 项目结构
```
├── UI/                 # 用户界面层
│   ├── Admin/         # 管理员页面
│   ├── User/          # 用户页面
│   └── Login.aspx     # 登录页面
├── BLL/               # 业务逻辑层
├── DAL/               # 数据访问层
├── Bin/               # 程序集文件
├── Web.config         # 配置文件
└── AllTables_MySQL.sql # 数据库脚本
```

## 注意事项
- 确保MySQL服务已启动
- 检查数据库连接字符串配置
- 首次运行需要执行数据库脚本 