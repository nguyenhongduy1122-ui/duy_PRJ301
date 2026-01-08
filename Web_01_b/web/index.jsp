<%-- 
    Document   : index
    Created on : Jan 5, 2026, 11:23:53 AM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>HTML Forms</h1>

        <form action="index.html" method="get">

            <div class="row">
                <label>Textbox</label>
                <input type="text" name="txtText" size="15">
            </div>

            <div class="row">
                <label>Password</label>
                <input type="password" name="txtPassword" size="15">
            </div>

            <input type="hidden" name="txtHidden" value="hiddenValue">

            <div class="row">
                <label>Male</label>
                <input type="checkbox" name="chkCheck" checked>
            </div>

            <div class="row">
                <label>Status</label>
                <input type="radio" name="rdoStatus" value="Single" checked> Single
                <input type="radio" name="rdoStatus" value="Married"> Married
                <input type="radio" name="rdoStatus" value="Divorsed"> Divorsed
            </div>

            <div class="row">
                <label>ComboBox</label>
                <select name="txtCombo">
                    <option value="Servlet">JSP and Servlet</option>
                    <option value="EJB">EJB</option>
                </select>
            </div>

            <div class="row">
                <label>Multiple</label>
                <select name="txtList" multiple size="3">
                    <option value="Servlet" selected>JSP and Servlet</option>
                    <option value="EJB" selected>EJB</option>
                    <option value="Java">Core Java</option>
                </select>
            </div>

            <div class="row">
                <label>TextArea</label>
                <textarea name="txtArea" rows="4" cols="25">
This is a form
parameters demo!!!
                </textarea>
            </div>

            <div class="buttons">
                <input type="submit" value="Submit Query">
                <input type="submit" value="Register" name="action">
                <input type="reset" value="Reset">
                <input type="button" value="JavaScript" onclick="alert('Hello JavaScript!')">
            </div>

        </form>
    </body>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #fce4ec);
            margin: 0;
            padding: 30px;

            display: flex;
            flex-direction: column;   
            align-items: center;
        }

        form {
            background-color: #ffffff;
            width: 450px;
            padding: 25px 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        h1 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .row {
            margin-bottom: 14px;
        }

        label {
            display: inline-block;
            width: 100px;
            font-weight: bold;
            color: #555;
            vertical-align: top;
        }

        input[type="text"],
        input[type="password"],
        select,
        textarea {
            width: 220px;
            padding: 6px;
            border: 1px solid #bbb;
            border-radius: 5px;
            transition: 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        select:focus,
        textarea:focus {
            border-color: #2196f3;
            outline: none;
            box-shadow: 0 0 5px rgba(33, 150, 243, 0.4);
        }

        textarea {
            resize: none;
        }

        .buttons {
            text-align: center;
            margin-top: 20px;
        }

        .buttons input {
            padding: 7px 14px;
            margin: 0 5px;
            border: none;
            border-radius: 6px;
            background-color: #2196f3;
            color: white;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s;
        }

        .buttons input[type="reset"] {
            background-color: #9e9e9e;
        }

        .buttons input[type="button"] {
            background-color: #4caf50;
        }

        .buttons input:hover {
            opacity: 0.85;
            transform: translateY(-1px);
        }
    </style>


</html>
