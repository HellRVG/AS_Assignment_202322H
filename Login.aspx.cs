﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace AS_Assignment_202322H
{
    public partial class Login : System.Web.UI.Page
    {
        string AssignmentDBConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["AssignmentDBConnection"].ConnectionString;
        //static string errorMsg = "";

        public class MyObject
        {
            public string success { get; set; }
            public List<string> ErrorMessage { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public bool ValidateCaptcha()
        {
            bool result = true;

            //When user submits the recaptcha form, the user gets a response POST parameter. 
            //captchaResponse consist of the user click pattern. Behaviour analytics! AI :) 
            string captchaResponse = Request.Form["g-recaptcha-response"];

            //To send a GET request to Google along with the response and Secret key.
            HttpWebRequest req = (HttpWebRequest)WebRequest.Create
           (" https://www.google.com/recaptcha/api/siteverify?secret=SITEKEY &response=" + captchaResponse);


            try
            {

                //Codes to receive the Response in JSON format from Google Server
                using (WebResponse wResponse = req.GetResponse())
                {
                    using (StreamReader readStream = new StreamReader(wResponse.GetResponseStream()))
                    {
                        //The response in JSON format
                        string jsonResponse = readStream.ReadToEnd();

                        //To show the JSON response string for learning purpose
                        //lbl_gScore.Text = jsonResponse.ToString();

                        JavaScriptSerializer js = new JavaScriptSerializer();

                        //Create jsonObject to handle the response e.g success or Error
                        //Deserialize Json
                        MyObject jsonObject = js.Deserialize<MyObject>(jsonResponse);

                        //Convert the string "False" to bool false or "True" to bool true
                        result = Convert.ToBoolean(jsonObject.success);//

                    }
                }

                return result;
            }
            catch (WebException ex)
            {
                throw ex;
            }
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>window.alert('before getDBHash.')</script>");         
            string pwd = tb_pwd.Text.ToString().Trim();
            string userid = tb_userid.Text.ToString().Trim();

            SHA512Managed hashing = new SHA512Managed();
            string dbHash = getDBHash(userid);
            string dbSalt = getDBSalt(userid);

            try
            {
                if (ValidateCaptcha())
                {
                    if (dbSalt != null && dbSalt.Length > 0 && dbHash != null && dbHash.Length > 0)
                    {
                        string pwdWithSalt = pwd + dbSalt;
                        byte[] hashWithSalt = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwdWithSalt));
                        string userHash = Convert.ToBase64String(hashWithSalt);

                        if (userHash.Equals(dbHash))
                        {
                            Session["UserID"] = userid;

                            string guid = Guid.NewGuid().ToString();
                            Session["AuthToken"] = guid;

                            Response.Cookies.Add(new HttpCookie("AuthToken", guid));

                            Response.Redirect("Homepage.aspx", false);
                        }
                        else
                        {
                            lbl_errormsg.Text = "Email or password is not valid. Please try again.";
                        }
                    }
                }
                else
                {
                    lbl_errormsg.Text = "Validate captcha to prove that you are a human.";
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }

            finally { }
        }

        protected string getDBHash(string userid)
        {

            string h = null;

            SqlConnection connection = new SqlConnection(AssignmentDBConnectionString);
            string sql = "select PasswordHash FROM Account WHERE Email=@USERID";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@USERID", userid);

            try
            {
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {

                    while (reader.Read())
                    {
                        if (reader["PasswordHash"] != null)
                        {
                            if (reader["PasswordHash"] != DBNull.Value)
                            {
                                h = reader["PasswordHash"].ToString();
                            }
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }

            finally { connection.Close(); }
            return h;
        }

        protected string getDBSalt(string userid)
        {

            string s = null;

            SqlConnection connection = new SqlConnection(AssignmentDBConnectionString);
            string sql = "select PASSWORDSALT FROM ACCOUNT WHERE Email=@USERID";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@USERID", userid);

            try
            {
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader["PASSWORDSALT"] != null)
                        {
                            if (reader["PASSWORDSALT"] != DBNull.Value)
                            {
                                s = reader["PASSWORDSALT"].ToString();
                            }
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }

            finally { connection.Close(); }
            return s;

        }

        protected string decryptData(byte[] cipherText)
        {

            string decryptedString = null;
            //byte[] cipherText = Convert.FromBase64String(cipherString);

            try
            {
                RijndaelManaged cipher = new RijndaelManaged();
                ICryptoTransform decryptTransform = cipher.CreateDecryptor();

                //Decrypt
                //byte[] decryptedText = decryptTransform.TransformFinalBlock(cipherText, 0, cipherText.Length);
                //decryptedString = Encoding.UTF8.GetString(decryptedText);


            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }

            finally { }
            return decryptedString;
        }


    }
}