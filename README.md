<h1 align="center">
  <a href="https://cdn-icons-png.flaticon.com/512/226/226777.png"><img src="https://cdn-icons-png.flaticon.com/512/226/226777.png" alt="Markdownify" width="100"></a> &nbsp; &nbsp;&nbsp;
    <a href="https://image.flaticon.com/icons/png/512/28/28968.png"><img src="https://image.flaticon.com/icons/png/512/28/28968.png" alt="Markdownify" width="100"></a> &nbsp; &nbsp;&nbsp;
        <a href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Apache_Tomcat_logo.svg/1200px-Apache_Tomcat_logo.svg.png"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Apache_Tomcat_logo.svg/1200px-Apache_Tomcat_logo.svg.png" alt="Markdownify" width="100"></a> &nbsp; &nbsp;&nbsp;
                <a href="https://1000marcas.net/wp-content/uploads/2020/11/MySQL-logo.png"><img src="https://1000marcas.net/wp-content/uploads/2020/11/MySQL-logo.png" alt="Markdownify" width="150" height="120"></a> &nbsp; &nbsp;&nbsp;
    <a href="https://jquery.com/jquery-wp-content/themes/jquery/images/logo-jquery.png"><img src="https://jquery.com/jquery-wp-content/themes/jquery/images/logo-jquery.png" alt="Markdownify" width="180" height="85"></a>&nbsp; &nbsp;&nbsp;
  <a href="https://cdn-icons-png.flaticon.com/512/187/187684.png"><img src="https://cdn-icons-png.flaticon.com/512/187/187684.png" alt="Markdownify" width="100"></a> &nbsp; &nbsp;&nbsp;
  <a href="https://www.harrisonpl.org/images/events/1521727838.png"><img src="https://www.harrisonpl.org/images/events/1521727838.png" alt="Markdownify" width="150" height="110"></a> &nbsp; &nbsp;&nbsp;
  <a href="http://3.bp.blogspot.com/-2m597Zivtug/VdkADGbn6WI/AAAAAAAAAmA/rn7psuPNe38/s1600/Eclipse-luna.png"><img src="http://3.bp.blogspot.com/-2m597Zivtug/VdkADGbn6WI/AAAAAAAAAmA/rn7psuPNe38/s1600/Eclipse-luna.png" alt="Markdownify" width="100"></a> &nbsp; &nbsp;&nbsp;
  <br><br>
  Using TomCat-Server, JSP, JSTL, JDBC and Servlets to create a CRUD Application using MVC and Bootstrap/JQuery.
  <br>
</h1>
<h4 align="center">
Using TomCat-Server, JSP, JSTL, JDBC and Servlets to create a CRUD Application using MVC and Bootstrap/JQuery. Also, includes basic examples about how to use JSP, JSTL, JDBC and Servlets.
</h4>

<p align="center">
  • <a href="#structure">Structure</a> •
  <a href="#installation">Requirements</a> •
  <a href="#run-it">Run it</a> •
  <a href="#credits">Credits</a>
</p>


## Structure
This repository is divided in 6 folders, 4 of them are Eclipse projects:
1.  <b>JSP-Demo</b>
2.  <b>Servlet-Demo</b>
3.  <b>Tag-Demo</b>
4.  <b>Web-Student-Tracker</b>

The folder called <i>"Tag-Demo"</i> contains:
*  Examples about how to use JSTLs Tags.

The folder called <i>"JSP-Demo"</i> contains:
*  Examples about how to use the JSPs.
*  Example of JSPs with forms, cookies and sessions.

The folder called <i>"Servlet-Demo"</i> contains:
*  Servlets with examples about how to use MVC archictecture with JSPs. 

And the final project with MVC Architecture using Servlets and JSPs is the folder called <i>"Web-Student-Tracker"</i>:
*  Contains a CRUD Application to list, search, add, edit and delete students
*  Here you can see images of the project:
<br>

<img src="https://github.com/luisfelipe7/Java-MVC-Using-JSP-JSTL-JDBC-Servlets-Bootstrap-JQuery/blob/master/Images/Student-List.png" alt="Models" width="2000" height="500">

<br>

<img src="https://github.com/luisfelipe7/Java-MVC-Using-JSP-JSTL-JDBC-Servlets-Bootstrap-JQuery/blob/master/Images/Student-Add.png" alt="Models" width="2000" height="500">

<br>

<img src="https://github.com/luisfelipe7/Java-MVC-Using-JSP-JSTL-JDBC-Servlets-Bootstrap-JQuery/blob/master/Images/Student-Update.png" alt="Models" width="2000" height="500">

<br>

<img src="https://github.com/luisfelipe7/Java-MVC-Using-JSP-JSTL-JDBC-Servlets-Bootstrap-JQuery/blob/master/Images/Student-Alerts.png" alt="Models" width="2000" height="500">
<br>

Then, the folder called <i>"Images"</i> contains the previous images and the one called <i> "Scripts" </i> contains that scripts that need to be executed before using the Web-Student-Tracker application.


## Requirements
1. Donwload/Configure Eclipse for Java and Web Developers: https://www.eclipse.org/downloads/packages/release/2021-12/r/eclipse-ide-enterprise-java-and-web-developers
2. Download/Configure Tomcat: https://tomcat.apache.org/download-90.cgi (Choose Core and Windows Installer for Windows)
3. Download/Install MySQL Workbench: https://dev.mysql.com/downloads/workbench/

## Run it
First of all, for all the project we need to configure Tomcat as a server in Eclipse, please use this to configure Tomcat:
https://www.javatpoint.com/how-to-configure-tomcat-server-in-eclipse-ide.

Then to import each project you need to use this:

1. Go to File -> Import ...

2. Select Existing Projects into Workspace

3. Click Next

4. Click the radio button next to Select root directory and click the Browse button

5. Navigate to the root directory where you extracted the project zip file

6. Click Finish

Note: The system may give you an error about the Java Runtime Environment.

You can resolve this with the following steps.

1. Right-click your Project and select Properties ...

2. In the left hand menu, click Java Build Path

3. In the center of the dialog, click Libraries

4. In the list, select JRE System Library

5. Click the Edit button on right-hand side of this dialog

6. Select the radio button: Workspace default JRE

7. Click Finish

This will resolve the error.

---

How to execute each project?
1.  <b>JSP-Demo</b>: Just execute on the server the jsps files.
2.  <b>Servlet-Demo</b>: Just execute on the server the MvcDemoServlet and MvcDemoServletTwo.
3.  <b>Tag-Demo</b>:  Just execute on the server the jsps files.
4.  <b>Web-Student-Tracker</b>: Execute the scripts located on the folder "Scripts" on mysql then execute on the Tomcat: StudentControllerServlet.

## Credits

Thanks to UNA (Universidad Nacional de Costa Rica) for teaching everything I know about Java, JSP, Servlets, JDBC, MySQL and others. Also, thanks to [@darbyluv2code](https://github.com/darbyluv2code)  for helping me review these technologies via the Udemy Course:
https://www.udemy.com/course/jsp-tutorial/

---

> GitHub [@luisfelipe7](https://github.com/luisfelipe7) &nbsp;&middot;&nbsp;
