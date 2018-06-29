<%--
  Created by IntelliJ IDEA.
  User: ericwong
  Date: 2018/6/28
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Login Page</title>

      <script>

          function ajaxFunction(){
              var xmlHttp;
              try{ // Firefox, Opera 8.0+, Safari
                  xmlHttp=new XMLHttpRequest();
              }
              catch (e){
                  try{// Internet Explorer
                      xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
                  }
                  catch (e){
                      try{
                          xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                      }
                      catch (e){}
                  }
              }

              return xmlHttp;
          }


          function Post() {

              var xmlhttp,un;

              un = document.getElementById('name').value;

              xmlhttp = ajaxFunction();
              xmlhttp.open("POST","login",true);
              xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
              xmlhttp.send("name="+un);

              xmlhttp.onreadystatechange = function () {
                  if(xmlhttp.readyState === 4 && xmlhttp.status === 200)
                  {
                      if(xmlhttp.responseText == 1){
                          document.getElementById("span1").innerHTML = "Username is EXIST!";
                      }else {
                          document.getElementById("span1").innerHTML = "Username Avaliable!";
                      }
                  }
              }
          }


      </script>
  </head>
  <body>
  <div style="width: 100%;height: 433px;position: absolute;top: 22%;left:30%">
      <form action="login" method="get">
          <table border="1 px" width="600 px">
              <tr>
                  <td>Username</td>
                  <td><input id="name" name="name" type="text" onblur="Post()"><span id="span1">Username
                      Checking...</span></td>
              </tr>
              <tr>
                  <td>Password</td>
                  <td><input name="password" type="password"></td>
              </tr>
              <tr>
                  <td>E-mail</td>
                  <td><input name="mail" type="email"></td>
              </tr>
              <tr>
                  <td>Adress</td>
                  <td><input name="adress" type="text"></td>
              </tr>
              <tr>
                  <td style="text-align: center" colspan="2" rowspan="2">
                      <input type="submit" style="width: 30%;height: 20px" value="提交">
                  </td>
              </tr>
          </table>
      </form>
  </div>
  </body>
</html>
