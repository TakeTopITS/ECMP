using NHibernate;

using Npgsql;//using System.Data.SqlClient;

using System;
using System.Collections;
using System.Configuration;
using System.Web;

namespace ProjectMgt.DAL
{
    public class EntityControl
    {
        private static EntityControl entity;

        private string _AssemblyName;

        private static readonly object padlock = new object();

        public static EntityControl CreateEntityControl(string AssemblyName)
        {
            if (entity == null)
            {
                lock (padlock)
                {
                    if (entity == null)
                    {
                        entity = new EntityControl();

                        entity._AssemblyName = AssemblyName;
                    }
                }
            }

            return entity;
        }

        public void AddEntity(Object entity)
        {
            ISession session = SessionFactory.OpenSession(_AssemblyName);

            ITransaction transaction = session.BeginTransaction();

            try
            {
                session.Save(entity);

                transaction.Commit();


                //---保存用户操作日志到日志表----
                InsertUserOperateLog("Add Record " + entity.ToString());



            }
            catch (Exception ex)
            {
                transaction.Rollback();

                throw ex;
            }
            finally
            {
                session.Close();
            }
        }

        public void UpdateEntity(Object entity, Object key)
        {
            ISession session = SessionFactory.OpenSession(_AssemblyName);

            ITransaction transaction = session.BeginTransaction();

            try
            {
                session.Update(entity, key);


                transaction.Commit();

                //---保存用户操作日志到日志表----
                InsertUserOperateLog("Update Record " + entity.ToString() + "," + " The Key is " + key.ToString());
            }
            catch (Exception ex)
            {
                transaction.Rollback();

                throw ex;
            }
            finally
            {
                session.Close();
            }
        }

        public void DeleteEntity(object entity)
        {
            ISession session = SessionFactory.OpenSession(_AssemblyName);

            ITransaction transaction = session.BeginTransaction();

            try
            {
                session.Delete(entity);

                transaction.Commit();

                //---保存用户操作日志到日志表----
                InsertUserOperateLog("Delete Record " + entity.ToString());
            }
            catch (Exception ex)
            {
                transaction.Rollback();

                throw ex;
            }
            finally
            {
                session.Close();
            }
        }

        public IList GetEntities(string strHQL)
        {
            IList lst;

            ISession session = SessionFactory.OpenSession(_AssemblyName);

            lst = session.CreateQuery(strHQL).List();

            session.Close();

            //---保存用户操作日志到日志表----
            InsertUserOperateLog(strHQL);

            return lst;
        }

        #region ---自加代码-----------------------------------------------------------

        //保存用户操作日志到日志表
        public void InsertUserOperateLog(string strHQL)
        {
            string strSQL, strHQL1, strHQL2;
            string strUserCode, strUserName, strUserIP;

            try
            {
                if (System.Configuration.ConfigurationManager.AppSettings["SaveOperateLog"] == "YES")
                {
                    try
                    {
                        if (strHQL.IndexOf("BySystem") == -1 & strHQL.IndexOf("LicenseVerification") == -1)
                        {
                            if (HttpContext.Current.Session["UserCode"] != null & HttpContext.Current.Session["UserName"] != null)
                            {
                                strUserCode = HttpContext.Current.Session["UserCode"].ToString().Trim();
                                strUserName = HttpContext.Current.Session["UserName"].ToString().Trim();

                                strUserIP = HttpContext.Current.Request.UserHostAddress.Trim();

                                strHQL1 = "from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
                                strHQL1 = strHQL1.Replace(" ", "").ToUpper();
                                strHQL2 = strHQL.Replace(" ", "").ToUpper();

                                if (strHQL1 != strHQL2)
                                {
                                    strHQL = strHQL.Replace("'", "''");

                                    new System.Threading.Thread(delegate ()
                                    {
                                        try
                                        {
                                            strSQL = "Insert into T_UserOperateLog(UserCode,UserName,UserIP,OperateContent,OperateTime) ";
                                            strSQL += " Values(" + "'" + strUserCode + "'" + "," + "'" + strUserName + "'" + "," + "'" + strUserIP + "'" + "," + "'" + strHQL + "'" + ",now())";

                                            RunSqlCommand(strSQL);
                                        }
                                        catch
                                        {
                                        }
                                    }).Start();

                                }
                            }
                        }
                    }
                    catch
                    {
                    }
                }
            }
            catch
            {

            }
        }

        //运行SQL语句
        public static void RunSqlCommand(string strCmdText)
        {
            using (NpgsqlConnection myConnection = new NpgsqlConnection(
                   ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString))
            {

                ///创建Command
                NpgsqlCommand myCommand = new NpgsqlCommand(strCmdText, myConnection);
                myCommand.CommandTimeout = 600;

                ///打开链接
                myConnection.Open();

                myCommand.ExecuteNonQuery();

                myConnection.Close();

                if (myCommand != null)
                {
                    myCommand.Dispose();
                }
            }
        }

        #endregion ---自加代码-----------------------------------------------------------
    }
}