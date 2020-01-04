# MavenConfig

### 质量更新
    增加本地仓库配置

### 完善功能
    1> Maven环境配置安装
    2> Maven环境配置卸载

### 使用说明
    1> 使用管理员方式打开程序
    2> 发送指令完成需求
    3> 复制粘贴Maven文件完整路径
       例：E:\Program Files\apache-maven-3.6.2
	4> 自定义本地仓库名称
	   例：D:\JAVA\maven
    5> 根据指令交互操作

### 开发目的
    1> 适用于解包版的Maven
    2> 适用于减少Windows开发者配置Maven环境的时间
    3> 将Maven环境配置复杂简单化

### 手动配置
* 系统变量
	+ 变量名：`MAVEN_HOME` 变量值：Maven全路径
* Path变量
    + `%MAVEN_HOME%\bin`
* Maven本地仓库配置
	+ maven解压包\conf\settings.xml文件中查找`<localRepository>`标签，取消注释，设置本地仓库

### 下载
[MavenConfig](v1.1.2/release)

### 历史版本

#### 2020.01.04
* [v1.1.2](./v1.1.2)
	+ 修改本地仓库默认设置

#### 2019.11.25
* [v1.1.1](./v1.1.1)
    * 修复环境变量太长无法设置
    * 调整文件输出情况

#### 2019.10.30
* [v1.1.0](./v1.1.0)
    * 新增配置文件设置
	* 新增本地仓库配置

#### 2019.10.28
* [v1.0.0](./v1.0.0)
    * Maven快速配置环境变量

### 效果图
![主界面](pictures/mavenconfig.png)