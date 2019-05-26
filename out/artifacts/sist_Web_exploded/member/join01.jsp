<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>join01.jsp</title>
    <style>
      body {
        margin: 80% auto;
        width: 800px;
        text-align: center;
      }

      header {
        margin-left: 30px;
      }

      #nav {
        margin-left: 127px;
      }

      #nav ul {
        list-style: none;
      }

      #nav ul li {
        float: left;
        width: 147px;
        border-top: 1px solid black;
        border-left: 1px solid black;
        text-align: center;
        padding: 10px;
      }

      #agree {
        background: pink;
      }

      #nav ul li[id="agree"] {
        font-weight: bold;
      }

      #nav ul li[id="signupcomplete"] {
        border-right: 1px solid black;
      }

      #terms textarea {
        width: 499px;
        margin-left: 40px;
        border-right: 1px solid black;
        border-left: 1px solid black;
        border-bottom: 1px solid black;
        border-top: 1px solid black;
      }

      #confirm {
        text-align: center;
      }

      #buttons {
        margin-left: 340px;
      }

      #buttons input {
        border-radius: 5px;
        width: 100px;
      }
    </style>
  </head>

  <body>
    <header>
      <h1>회원가입</h1>
    </header>
    <section>
      <div id="nav">
        <ul>
          <li id="agree">약관동의</li>
          <li id="signup">정보입력</li>
          <li id="signupcomplete">가입완료</li>
        </ul>
      </div>
      <div id="terms">
        <br />
        <textarea rows="30" cols="30" readonly></textarea>
      </div>
      <div id="confirm">
        <br />
        <input type="checkbox" /> 약관에 동의합니다.
      </div>
      <div id="buttons">
        <br />
        <form action="join02.jsp" method="get">
          <input type="reset" value="취소" />
          <input type="submit" value="확인" />
        </form>
      </div>
    </section>
  </body>
</html>
